Enemy_fly = {}
setmetatable(Enemy_fly, Enemy)

function Enemy_fly:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 168, 169, 170, 181 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end