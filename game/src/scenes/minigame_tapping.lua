local assets = require("src.assets")
local Button = require("src.ui.button")
local panel = require("src.ui.panel")

local TappingMiniGame = {}
TappingMiniGame.__index = TappingMiniGame

function TappingMiniGame.new(data, onDone)
  local self = setmetatable({
    data = data,
    onDone = onDone,
    taps = 0,
    timer = data.seconds or 5,
    finished = false,
    button = nil,
  }, TappingMiniGame)
  self.button = Button.new("Tap", 110, 120, 100, 28, function()
    if self.finished then
      return
    end
    self.taps = self.taps + 1
    if self.taps >= self.data.goal then
      self.finished = true
      if self.onDone then
        self.onDone(true)
      end
    end
  end)
  return self
end

function TappingMiniGame:update(dt)
  if self.finished then
    return
  end
  self.timer = self.timer - dt
  if self.timer <= 0 then
    self.timer = 0
    self.finished = true
    if self.onDone then
      self.onDone(false)
    end
  end
end

function TappingMiniGame:draw()
  local bg = assets.getImage("bg_office")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(bg, 0, 0, 0, 320 / bg:getWidth(), 180 / bg:getHeight())

  panel.draw(32, 32, 256, 80)

  love.graphics.setColor(assets.palette.paper)
  love.graphics.print(self.data.title or "Tapping", 48, 40)
  love.graphics.print("Objectif: " .. self.data.goal, 48, 58)
  love.graphics.print("Taps: " .. self.taps, 48, 74)
  love.graphics.print("Temps: " .. string.format("%.1f", self.timer), 48, 90)

  self.button:draw()
end

function TappingMiniGame:pointerPressed(x, y)
  if self.button:contains(x, y) then
    self.button:press()
  end
end

return TappingMiniGame
