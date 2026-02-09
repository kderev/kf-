local assets = require("src.assets")
local Button = require("src.ui.button")
local panel = require("src.ui.panel")
local textWrap = require("src.ui.text")

local NarrativeScreen = {}
NarrativeScreen.__index = NarrativeScreen

function NarrativeScreen.new(data, onChoice)
  local self = setmetatable({
    data = data,
    onChoice = onChoice,
    buttons = {},
  }, NarrativeScreen)
  self:buildButtons()
  return self
end

function NarrativeScreen:buildButtons()
  self.buttons = {}
  local choices = self.data.choices or { "Continuer" }
  local total = #choices
  local buttonWidth = 140
  local buttonHeight = 20
  local spacing = 8
  local startX = 16
  local startY = 130

  for index, label in ipairs(choices) do
    local row = index - 1
    local x = startX + (row % 2) * (buttonWidth + spacing)
    local y = startY + math.floor(row / 2) * (buttonHeight + spacing)
    table.insert(self.buttons, Button.new(label, x, y, buttonWidth, buttonHeight, function()
      if self.onChoice then
        self.onChoice(index)
      end
    end))
  end
end

function NarrativeScreen:draw()
  local bg = assets.getImage(self.data.background or "bg_wakeup")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(bg, 0, 0, 0, 320 / bg:getWidth(), 180 / bg:getHeight())

  panel.draw(8, 96, 304, 76)

  love.graphics.setColor(assets.palette.paper)
  local font = love.graphics.getFont()
  love.graphics.print(self.data.title or "", 16, 102)

  local lines = textWrap.wrap(self.data.body or "", 288, font)
  for i, line in ipairs(lines) do
    love.graphics.print(line, 16, 114 + (i - 1) * (font:getHeight() + 1))
  end

  for _, button in ipairs(self.buttons) do
    button:draw()
  end
end

function NarrativeScreen:pointerPressed(x, y)
  for _, button in ipairs(self.buttons) do
    if button:contains(x, y) then
      button:press()
      return
    end
  end
end

return NarrativeScreen
