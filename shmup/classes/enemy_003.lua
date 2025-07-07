Enemy_003 = {}
setmetatable(Enemy_003, Enemy)

function Enemy_003:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 224, 224, 226, 226 }
  obj.width = 16
  obj.height = 16
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Enemy_003:draw()
  if self.flash > 0 then
    for i = 1, 15 do
      pal(i, 7)
    end
  end
  spr(
    self.sprites[flr(self.sprite_index)],
    self.x,
    self.y,
    flr(self.width / 8),
    flr(self.width / 8)
  )
  pal()
end