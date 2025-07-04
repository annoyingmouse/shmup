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
