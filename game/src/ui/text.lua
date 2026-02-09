local text = {}

function text.wrap(input, maxWidth, font)
  local words = {}
  for word in input:gmatch("%S+") do
    table.insert(words, word)
  end

  local lines = {}
  local line = ""
  for _, word in ipairs(words) do
    local testLine = line == "" and word or (line .. " " .. word)
    if font:getWidth(testLine) <= maxWidth then
      line = testLine
    else
      table.insert(lines, line)
      line = word
    end
  end
  if line ~= "" then
    table.insert(lines, line)
  end
  return lines
end

return text
