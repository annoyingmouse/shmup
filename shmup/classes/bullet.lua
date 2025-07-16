Bullet = {}
setmetatable(Bullet, Coordinates)

function Bullet:new(x, y)
  local obj = Coordinates:new(x, y)
  obj.speed = 4
  obj.width = {2, 4, 6}
  obj.height = {4, 6, 8}
  obj.sprite_index = 1
  obj.sprites = { 11, 12, 13 }
  obj.x = {x + 3, x + 2, x + 1}
  obj.y = {y + 2, y + 1, y}
  obj.x_index = 1
  obj.y_index = 1
  obj.width_index = 1
  obj.height_index = 1
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Bullet:move()
  self.y[flr(self.y_index)] = self.y[flr(self.y_index)] - self.speed
end

function Bullet:animate()
  if self.sprite_index < #self.sprites then
    self.sprite_index = self.sprite_index + 0.15
    self.x_index = self.x_index + 0.15
    self.y_index = self.y_index + 0.15  
    self.width_index = self.width_index + 0.15
    self.height_index = self.height_index + 0.15
  end
end

function Bullet:update()
  self:move()
  self:animate()
  if self.y[flr(self.y_index)] < -8 then
    return false
  end
  return true
end

function Bullet:getX()
  if(type(self.x) == "number") then
    return self.x + self.width / 2
  else
    return self.x[flr(self.x_index)] + self.width[flr(self.width_index)] / 2
  end
end

function Bullet:getY()
  if(type(self.y) == "number") then
    return self.y + self.height / 2
  else
    return self.y[flr(self.y_index)] + self.height[flr(self.height_index)] / 2
  end
end

function Bullet:getWidth()
  if(type(self.width) == "number") then
    return self.width
  else
    return self.width[flr(self.width_index)]
  end
end

function Bullet:getHeight()
  if(type(self.height) == "number") then
    return self.height
  else
    return self.height[flr(self.height_index)]
  end
end

function Bullet:draw()
  spr(self.sprites[flr(self.sprite_index)], self:getX(), self:getY(), 1, 1)
end
