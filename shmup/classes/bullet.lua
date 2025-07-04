Bullet = {}
setmetatable(Bullet, Coordinates)

function Bullet:new(x, y)
  local obj = Coordinates:new(x, y)
  obj.speed = 4
  obj.width = 8
  obj.height = 8
  obj.sprite_index = 1
  obj.sprites = { 4, 5, 6 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Bullet:move()
  self.y = self.y - self.speed
end

function Bullet:animate()
  if self.sprite_index < #self.sprites then
    self.sprite_index = self.sprite_index + 0.15
  end
end

function Bullet:update()
  self:move()
  self:animate()
  if self.y < -8 then
    return false
  end
  return true
end

function Bullet:draw()
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, 1, 1)
end
