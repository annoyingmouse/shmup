Explosion = {}
setmetatable(Explosion, Coordinates)

function Explosion:new(x, y)
  local obj = Coordinates:new(x, y)
  obj.sprite_index = 1
  obj.sprites = {64, 64, 66, 66, 66, 68, 68, 70, 70, 72}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Explosion:animate()
  if self.sprite_index < #self.sprites then
    self.sprite_index = self.sprite_index + 1
  end
end

function Explosion:update()
  self:animate()
  if self.sprite_index >= #self.sprites then
    return false
  end
  return true
end

function Explosion:draw()
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, 2, 2)
end
