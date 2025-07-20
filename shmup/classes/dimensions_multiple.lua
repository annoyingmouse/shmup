Dimensions_multiple = {}
setmetatable(Dimensions_multiple, Coordinates_multiple)

function Dimensions_multiple:new(x, y, x_index, y_index, width, height, width_index, height_index)
  local obj = Coordinates_multiple:new(x, y, x_index, y_index)
  obj.width = width
  obj.height = height
  obj.width_index = width_index or 1
  obj.height_index = height_index or 1
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Dimensions_multiple:setWidthIndex(width_index)
  self.width_index = width_index
end

function Dimensions_multiple:setHeightIndex(height_index)
  self.height_index = height_index
end

function Dimensions_multiple:getX()
  return self.x[flr(self.x_index)] + self:getWidth() / 2
end

function Dimensions_multiple:getY()
  return self.y[flr(self.y_index)] + self:getHeight() / 2
end

function Dimensions_multiple:getWidth()
  return self.width[flr(self.width_index)]
end

function Dimensions_multiple:getHeight()
  return self.height[flr(self.height_index)]
end