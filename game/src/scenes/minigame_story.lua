local assets = require("src.assets")
local Button = require("src.ui.button")
local panel = require("src.ui.panel")
local textWrap = require("src.ui.text")

local StoryMiniGame = {}
StoryMiniGame.__index = StoryMiniGame

function StoryMiniGame.new(data, onDone)
  local self = setmetatable({
    data = data,
    onDone = onDone,
    pageIndex = 1,
    pages = {},
    button = nil,
  }, StoryMiniGame)
  self.pages = data.pages or {}
  self.button = Button.new("Suivant", 200, 140, 96, 24, function()
    if self.pageIndex < #self.pages then
      self.pageIndex = self.pageIndex + 1
    else
      if self.onDone then
        self.onDone(true)
      end
    end
  end)
  return self
end

function StoryMiniGame:draw()
  local bg = assets.getImage("bg_office")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(bg, 0, 0, 0, 320 / bg:getWidth(), 180 / bg:getHeight())

  panel.draw(16, 24, 288, 120)

  love.graphics.setColor(assets.palette.paper)
  love.graphics.print(self.data.title or "Lecture", 24, 32)

  local font = love.graphics.getFont()
  local text = self.pages[self.pageIndex] or ""
  local lines = textWrap.wrap(text, 260, font)
  for i, line in ipairs(lines) do
    love.graphics.print(line, 24, 50 + (i - 1) * (font:getHeight() + 1))
  end

  if self.pageIndex == #self.pages then
    self.button.label = "Terminer"
  else
    self.button.label = "Suivant"
  end
  self.button:draw()
end

function StoryMiniGame:pointerPressed(x, y)
  if self.button:contains(x, y) then
    self.button:press()
  end
end

return StoryMiniGame
