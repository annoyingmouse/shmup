Enemy_001 = {}
setmetatable(Enemy_001, Enemy)

function Enemy_001:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 164, 164, 165, 165 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

