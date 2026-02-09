local assets = require("src.assets")
local Button = require("src.ui.button")
local panel = require("src.ui.panel")

local TimingMiniGame = {}
TimingMiniGame.__index = TimingMiniGame

function TimingMiniGame.new(data, onDone)
  local self = setmetatable({
    data = data,
    onDone = onDone,
    cursor = 0,
    speed = 0.6,
    direction = 1,
    stopped = false,
    success = false,
    button = nil,
  }, TimingMiniGame)
  self.button = Button.new("Stop", 110, 130, 100, 24, function()
    if not self.stopped then
      self.stopped = true
      local targetSize = data.target_size or 0.18
      local targetStart = 0.5 - targetSize / 2
      local targetEnd = 0.5 + targetSize / 2
      self.success = self.cursor >= targetStart and self.cursor <= targetEnd
      if self.onDone then
        self.onDone(self.success)
      end
    end
  end)
  return self
end

function TimingMiniGame:update(dt)
  if self.stopped then
    return
  end
  self.cursor = self.cursor + dt * self.speed * self.direction
  if self.cursor >= 1 then
    self.cursor = 1
    self.direction = -1
  elseif self.cursor <= 0 then
    self.cursor = 0
    self.direction = 1
  end
end

function TimingMiniGame:draw()
  local bg = assets.getImage("bg_office")
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(bg, 0, 0, 0, 320 / bg:getWidth(), 180 / bg:getHeight())

  panel.draw(32, 40, 256, 70)

  local targetSize = self.data.target_size or 0.18
  local barX, barY, barW, barH = 48, 70, 224, 12
  local targetStart = barX + barW * (0.5 - targetSize / 2)
  local targetWidth = barW * targetSize

  love.graphics.setColor(assets.palette.steel)
  love.graphics.rectangle("fill", barX, barY, barW, barH)

  love.graphics.setColor(assets.palette.red)
  love.graphics.rectangle("fill", targetStart, barY, targetWidth, barH)

  local cursorX = barX + barW * self.cursor
  love.graphics.setColor(assets.palette.paper)
  love.graphics.rectangle("fill", cursorX - 2, barY - 4, 4, barH + 8)

  love.graphics.setColor(assets.palette.paper)
  love.graphics.print(self.data.title or "Timing", 48, 48)

  self.button:draw()
end

function TimingMiniGame:pointerPressed(x, y)
  if self.button:contains(x, y) then
    self.button:press()
  end
end

return TimingMiniGame
