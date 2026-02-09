local Script = {}

function Script.load()
  local chunk = love.filesystem.load("data/script.lua")
  return chunk()
end

return Script
