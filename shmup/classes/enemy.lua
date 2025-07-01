Enemy = {}

function Enemy:new(x, speed)
  local obj = {
    x = x or 0,
    y = -8,
    speed = speed or 1,
    width = 8,
    height = 8,
    sprite_index = 1,
    sprites = {7, 8, 9, 10, 10}
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Enemy:move()
  self.y = self.y + self.speed
end

function Enemy:animate()
  if self.sprite_index < #self.sprites then
    self.sprite_index = self.sprite_index + 0.1
  else
    self.sprite_index = 1
  end
end

function Enemy:update()
  self:move()
  self:animate()
  if self.y > 128 then
    return false
  end
  return true
end

function Enemy:draw()
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, 1, 1)
end