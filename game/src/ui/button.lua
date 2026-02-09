local assets = require("src.assets")

local Button = {}
Button.__index = Button

function Button.new(label, x, y, w, h, onPress)
  local self = setmetatable({
    label = label,
    x = x,
    y = y,
    w = w,
    h = h,
    onPress = onPress,
  }, Button)
  return self
end

function Button:draw()
  love.graphics.setColor(assets.palette.steel)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 4, 4)
  love.graphics.setColor(assets.palette.neon)
  love.graphics.rectangle("line", self.x, self.y, self.w, self.h, 4, 4)
  love.graphics.setColor(assets.palette.paper)
  local font = love.graphics.getFont()
  local textWidth = font:getWidth(self.label)
  local textHeight = font:getHeight()
  love.graphics.print(
    self.label,
    self.x + (self.w - textWidth) / 2,
    self.y + (self.h - textHeight) / 2
  )
end

function Button:contains(x, y)
  return x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h
end

function Button:press()
  if self.onPress then
    self.onPress()
  end
end

return Button
