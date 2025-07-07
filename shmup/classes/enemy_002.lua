--[[
  30000003 03000030
  33000033 33000033
  33333333 33333333
  3b3333b3 3b3333b3
  3bbbbbb3 3bbbbbb3
  3b7bb7b3 3b7bb7b3
  3bbbbbb3 0b0000b0
  0b0000b0 00000000
]]--


Enemy_002 = {}
setmetatable(Enemy_002, Enemy)

function Enemy_002:new(x, speed, lives)
  local obj = Enemy:new(x, speed, lives)
  obj.sprites = { 168, 169, 170, 181 }
  setmetatable(obj, self)
  self.__index = self
  return obj
end