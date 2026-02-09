local app = require("src.app")

function love.load()
  app.load()
end

function love.update(dt)
  app.update(dt)
end

function love.draw()
  app.draw()
end

function love.resize()
  app.resize()
end

function love.mousepressed(x, y, button)
  if button == 1 then
    app.pointerPressed(x, y)
  end
end

function love.touchpressed(_, x, y)
  app.pointerPressed(x, y)
end
