Enemy_spinner = {}
setmetatable(Enemy_spinner, Enemy)

function Enemy_spinner:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 200, 201, 202, 203 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Enemy_spinner:draw()
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