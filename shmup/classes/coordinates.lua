Coordinates = {}

function Coordinates:new(x, y)
  local obj = {
    x = x or 0,  -- Default x coordinate
    y = y or 0   -- Default y coordinate
  }
  setmetatable(obj, Coordinates)
  self.__index = self
  return obj
end

function Coordinates:getX()
  return self.x
end

function Coordinates:getY()
  return self.y
end

function Coordinates:getWidth()
  return self.width
end

function Coordinates:getHeight()
  return self.height
end