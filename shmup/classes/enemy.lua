Enemy = {}
setmetatable(Enemy, Coordinates)

function Enemy:new(x, speed, lives)
  local obj = Coordinates:new(x, -8)
  obj.speed = speed or 1
  obj.width = 8
  obj.height = 8
  obj.sprite_index = 1
  obj.lives = lives or 1
  obj.sprites = { 7, 8, 9, 10, 10 }
  obj.flash = 0
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
  if self.flash > 0 then
    self.flash = self.flash - 1
  end
  if self.y > 128 then
    return false
  end
  return true
end

function Enemy:draw()
  if self.flash > 0 then
    for i = 1, 15 do
      pal(i, 7)
    end
  else
    if self.lives == 3 then
      pal(3, 2)
      pal(11, 8)
    elseif self.lives == 2 then
      pal(3, 1)
      pal(11, 12)
    end
  end
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, 1, 1)
  pal()
end