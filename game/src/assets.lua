local assets = {
  images = {},
  palette = {
    ink = { 7 / 255, 9 / 255, 21 / 255, 1 },
    slate = { 26 / 255, 29 / 255, 58 / 255, 1 },
    steel = { 48 / 255, 62 / 255, 107 / 255, 1 },
    mist = { 140 / 255, 214 / 255, 198 / 255, 1 },
    paper = { 242 / 255, 243 / 255, 240 / 255, 1 },
    red = { 226 / 255, 61 / 255, 122 / 255, 1 },
    redGlow = { 1, 179 / 255, 209 / 255, 1 },
    neon = { 107 / 255, 1, 94 / 255, 1 },
  },
}

local function ensureImage(path)
  if assets.images[path] then
    return assets.images[path]
  end

  if love.filesystem.getInfo(path) then
    local image = love.graphics.newImage(path)
    image:setFilter("nearest", "nearest")
    assets.images[path] = image
    return image
  end

  local imageData = love.image.newImageData(1, 1)
  imageData:setPixel(0, 0, 1, 1, 1, 1)
  local image = love.graphics.newImage(imageData)
  image:setFilter("nearest", "nearest")
  assets.images[path] = image
  return image
end

function assets.init()
  love.graphics.setDefaultFilter("nearest", "nearest")
  assets.canvas = love.graphics.newCanvas(320, 180)
end

function assets.getImage(name)
  local path = "assets/" .. name .. ".png"
  return ensureImage(path)
end

return assets
