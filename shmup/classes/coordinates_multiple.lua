Coordinates_multiple = {}

function Coordinates_multiple:new(x, y, x_index, y_index)
  local obj = {
    x = x,
    y = y,
    x_index = x_index or 1,
    y_index = y_index or 1
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Coordinates_multiple:setXIndex(x_index)
  self.x_index = x_index
end

function Coordinates_multiple:setYIndex(y_index)
  self.y_index = y_index
end

function Coordinates_multiple:getX()
  return self.x[flr(self.x_index)]
end

function Coordinates_multiple:getY()
  return self.y[flr(self.y_index)]
end
