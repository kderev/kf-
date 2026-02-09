local assets = require("src.assets")

local panel = {}

function panel.draw(x, y, w, h)
  love.graphics.setColor(assets.palette.slate)
  love.graphics.rectangle("fill", x, y, w, h)
  love.graphics.setColor(assets.palette.mist)
  love.graphics.rectangle("line", x, y, w, h)
end

return panel
