Enemy_boss = {}
setmetatable(Enemy_boss, Enemy)

function Enemy_boss:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 224, 224, 226, 226 }
  obj.width = 16
  obj.height = 16
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Enemy_boss:draw()
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