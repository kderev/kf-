local Script = require("src.script")

local GameState = {}
GameState.__index = GameState

function GameState.new()
  local script = Script.load()
  local self = setmetatable({
    script = script,
    week = 1,
    day = 1,
    work_successes = 0,
    is_tv_locked = false,
    wakeup_pose = "inBed",
    flags = {},
    special_id = nil,
    tv_day = 0,
    completed_minigames = {},
  }, GameState)
  return self
end

function GameState:reset()
  self.week = 1
  self.day = 1
  self.work_successes = 0
  self.is_tv_locked = false
  self.wakeup_pose = "inBed"
  self.flags = {}
  self.special_id = nil
  self.tv_day = 0
  self.completed_minigames = {}
end

function GameState:getDayData()
  local weekData = self.script.weeks[self.week]
  if not weekData then
    return nil
  end
  return weekData.days[self.day]
end

function GameState:getWorkData()
  local weekData = self.script.weeks[self.week]
  if not weekData then
    return nil
  end
  local work = weekData.work[self.day]
  if not work then
    return nil
  end

  local story = work.story
  if story and story.arc and story.arc_step then
    local arc = self.script.arcs[story.arc]
    if arc and arc[story.arc_step] then
      local arcEntry = arc[story.arc_step]
      story = {
        id = story.id,
        title = story.title,
        summary = story.summary,
        arc = story.arc,
        arc_step = story.arc_step,
        pages = arcEntry.pages,
      }
    end
  end

  return {
    title = work.title,
    body = work.body,
    timing = work.timing,
    tapping = work.tapping,
    story = story,
  }
end

function GameState:getNarrativeData()
  if self.special_id then
    local special = self.script.specials[self.special_id]
    return {
      background = special.background,
      title = special.title,
      body = special.body,
      choices = special.choices,
      isSpecial = true,
    }
  end

  local dayData = self:getDayData()
  if not dayData then
    return {
      background = "bg_wakeup",
      title = "Fin",
      body = "Le cycle recommence.",
      choices = { "Recommencer" },
      isSpecial = true,
    }
  end

  return {
    background = "bg_wakeup",
    title = dayData.title,
    body = dayData.wakeup_body,
    choices = { "Se lever" },
    isSpecial = false,
  }
end

function GameState:handleNarrativeChoice(choiceIndex)
  if not self.special_id then
    return "workday"
  end

  if self.special_id == "coffee" then
    self.special_id = "contagion"
    return "special"
  end

  if self.special_id == "contagion" then
    self.special_id = "revolt"
    return "special"
  end

  if self.special_id == "revolt" then
    return "restart"
  end

  if self.special_id == "fired" then
    if choiceIndex == 2 then
      self.week = 2
      self.day = 1
      self.work_successes = 0
      self.special_id = nil
      self.completed_minigames = {}
      return "workday"
    end
    self.special_id = "tv_day1"
    self.tv_day = 1
    return "special"
  end

  if self.special_id == "tv_day1" then
    self.special_id = "tv_day2"
    self.tv_day = 2
    return "special"
  end

  if self.special_id == "tv_day2" then
    self.special_id = "tv_day3"
    self.tv_day = 3
    return "special"
  end

  if self.special_id == "tv_day3" then
    self.special_id = "game_over"
    return "special"
  end

  if self.special_id == "game_over" then
    return "restart"
  end

  self.special_id = nil
  return "workday"
end

function GameState:markMiniGameComplete(miniId)
  self.completed_minigames[miniId] = true
end

function GameState:isMiniGameComplete(miniId)
  return self.completed_minigames[miniId] == true
end

function GameState:finishDay(success)
  if success then
    self.work_successes = self.work_successes + 1
  end

  self.day = self.day + 1
  self.completed_minigames = {}

  if self.day > 5 then
    if self.work_successes >= 3 then
      self.special_id = "coffee"
    else
      self.special_id = "fired"
    end
    self.day = 1
    self.work_successes = 0
  end
end

return GameState
