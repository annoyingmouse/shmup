Bullet = {}
setmetatable(Bullet, Dimensions_multiple)

function Bullet:new(x, y)
  local obj = Dimensions_multiple:new(
    {x + 3, x + 2, x + 1},
    {y + 2, y + 1, y},
    1,
    1,
    {2, 4, 6},
    {4, 6, 8},
    1,
    1
  )
  obj.speed = 4
  obj.sprite_index = 1
  obj.sprites = { 11, 12, 13 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Bullet:move()
  for i = 1, #self.x do
    self.y[i] = self.y[i] - self.speed
  end
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

function Bullet:draw()
  spr(self.sprites[flr(self.sprite_index)], self:getX() - 4, self:getY(), 1, 1)
end
