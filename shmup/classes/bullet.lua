Bullet = {}

function Bullet:new(x, y)
  local obj = {
    x = x or 0,
    y = y or 0,
    speed = 4,
    width = 8,
    height = 8,
    sprite_index = 1,
    sprites = { 4, 5, 6 } -- List of sprites for the bullet animation
  }
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
  if self.y < -8 then -- If the bullet goes off-screen, remove it
    return false
  end
  return true
end

function Bullet:draw()
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, 1, 1)
end
