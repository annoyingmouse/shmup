Coordinates = {}

function Coordinates:new(x, y)
  local obj = {
    x = x or 0,
    y = y or 0
  }
  setmetatable(obj, Coordinates)
  self.__index = self
  return obj
end

function Coordinates:setX(x)
  self.x = x
end

function Coordinates:setY(y)
  self.y = y
end

function Coordinates:getX()
  return self.x
end

function Coordinates:getY()
  return self.y
end