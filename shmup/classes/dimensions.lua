Dimensions = {}
setmetatable(Dimensions, Coordinates)

function Dimensions:new(x, y, width, height)
  local obj = Coordinates:new(x, y)
  obj.width = width
  obj.height = height
  setmetatable(obj, Dimensions)
  self.__index = self
  return obj
end

function Dimensions:setWidth(width)
  self.width = width
end

function Dimensions:setHeight(height)
  self.height = height
end

function Dimensions:getWidth()
  return self.width
end

function Dimensions:getHeight()
  return self.height
end