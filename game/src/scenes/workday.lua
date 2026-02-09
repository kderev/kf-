local assets = require("src.assets")
local Button = require("src.ui.button")
local panel = require("src.ui.panel")
local textWrap = require("src.ui.text")

local WorkDayScreen = {}
WorkDayScreen.__index = WorkDayScreen

function WorkDayScreen.new(state, callbacks)
  local self = setmetatable({
    state = state,
    callbacks = callbacks,
    buttons = {},
  }, WorkDayScreen)
  self:buildButtons()
  return self
end

function WorkDayScreen:buildButtons()
  self.buttons = {}
  local work = self.state:getWorkData()
  if not work then
    return
  end

  local items = {
    { kind = "timing", data = work.timing },
    { kind = "tapping", data = work.tapping },
    { kind = "story", data = work.story },
  }

  local y = 80
  for _, item in ipairs(items) do
    local label = item.data.title
    if self.state:isMiniGameComplete(item.data.id) then
      label = label .. " ✓"
    end
    table.insert(self.buttons, Button.new(label, 16, y, 288, 18, function()
      if self.callbacks and self.callbacks.onSelectMiniGame then
        self.callbacks.onSelectMiniGame(item.kind, item.data)
      end
    end))
    y = y + 22
  end

  table.insert(self.buttons, Button.new("Valider la journée", 16, 148, 288, 20, function()
    local allDone = true
    for _, item in ipairs(items) do
      if not self.state:isMiniGameComplete(item.data.id) then
        allDone = false
      end
    end
    if self.callbacks and self.callbacks.onValidateDay then
      self.callbacks.onValidateDay(allDone)
    end
  end))
end

function WorkDayScreen:draw()
  local bg = assets.getImage("bg_office")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(bg, 0, 0, 0, 320 / bg:getWidth(), 180 / bg:getHeight())

  panel.draw(8, 16, 304, 56)

  local work = self.state:getWorkData()
  love.graphics.setColor(assets.palette.paper)
  local font = love.graphics.getFont()
  love.graphics.print(work.title, 16, 20)

  local lines = textWrap.wrap(work.body, 288, font)
  for i, line in ipairs(lines) do
    love.graphics.print(line, 16, 32 + (i - 1) * (font:getHeight() + 1))
  end

  for _, button in ipairs(self.buttons) do
    button:draw()
  end
end

function WorkDayScreen:pointerPressed(x, y)
  for _, button in ipairs(self.buttons) do
    if button:contains(x, y) then
      button:press()
      return
    end
  end
end

return WorkDayScreen
