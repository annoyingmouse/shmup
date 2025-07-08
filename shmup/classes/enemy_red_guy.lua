Enemy_red_guy = {}
setmetatable(Enemy_red_guy, Enemy)

function Enemy_red_guy:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 164, 164, 165, 165 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end