local assets = require("src.assets")
local GameState = require("src.state")
local NarrativeScreen = require("src.scenes.narrative")
local WorkDayScreen = require("src.scenes.workday")
local TimingMiniGame = require("src.scenes.minigame_timing")
local TappingMiniGame = require("src.scenes.minigame_tapping")
local StoryMiniGame = require("src.scenes.minigame_story")

local app = {
  baseWidth = 320,
  baseHeight = 180,
  scale = 1,
  offsetX = 0,
  offsetY = 0,
}

local currentScreen
local state

local function setScreen(screen)
  currentScreen = screen
  if currentScreen and currentScreen.enter then
    currentScreen.enter()
  end
end

local function makeWorkdayScreen()
  return WorkDayScreen.new(state, {
    onSelectMiniGame = function(kind, payload)
      if kind == "timing" then
        setScreen(TimingMiniGame.new(payload, function(success)
          if success then
            state:markMiniGameComplete(payload.id)
          end
          setScreen(makeWorkdayScreen())
        end))
      elseif kind == "tapping" then
        setScreen(TappingMiniGame.new(payload, function(success)
          if success then
            state:markMiniGameComplete(payload.id)
          end
          setScreen(makeWorkdayScreen())
        end))
      elseif kind == "story" then
        setScreen(StoryMiniGame.new(payload, function(success)
          if success then
            state:markMiniGameComplete(payload.id)
          end
          setScreen(makeWorkdayScreen())
        end))
      end
    end,
    onValidateDay = function(success)
      state:finishDay(success)
      setScreen(makeNarrativeScreen())
    end,
  })
end

function makeNarrativeScreen()
  local data = state:getNarrativeData()
  return NarrativeScreen.new(data, function(choiceIndex)
    local next = state:handleNarrativeChoice(choiceIndex)
    if next == "workday" then
      setScreen(makeWorkdayScreen())
    elseif next == "restart" then
      state:reset()
      setScreen(makeNarrativeScreen())
    else
      setScreen(makeNarrativeScreen())
    end
  end)
end

function app.load()
  assets.init()
  state = GameState.new()
  app.resize()
  setScreen(makeNarrativeScreen())
end

function app.update(dt)
  if currentScreen and currentScreen.update then
    currentScreen.update(dt)
  end
end

function app.draw()
  love.graphics.setCanvas(assets.canvas)
  love.graphics.clear(assets.palette.ink)
  if currentScreen and currentScreen.draw then
    currentScreen.draw()
  end
  love.graphics.setCanvas()

  love.graphics.clear(0, 0, 0, 1)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(assets.canvas, app.offsetX, app.offsetY, 0, app.scale, app.scale)
end

function app.resize()
  local w, h = love.graphics.getDimensions()
  local scale = math.min(w / app.baseWidth, h / app.baseHeight)
  app.scale = math.floor(scale)
  if app.scale < 1 then
    app.scale = scale
  end
  app.offsetX = math.floor((w - app.baseWidth * app.scale) / 2)
  app.offsetY = math.floor((h - app.baseHeight * app.scale) / 2)
end

function app.pointerPressed(x, y)
  local localX = (x - app.offsetX) / app.scale
  local localY = (y - app.offsetY) / app.scale
  if currentScreen and currentScreen.pointerPressed then
    currentScreen.pointerPressed(localX, localY)
  end
end

return app
