Expanding_effect = {}

function Expanding_effect:new(x, y, vx, vy, lifetime, age)
  local obj = {
    x = x,
    y = y,
    vx = vx,
    vy = vy,
    lifetime = lifetime or 30, -- Default lifetime
    age = age or 0, -- Default age
  }
  setmetatable(obj, Expanding_effect)
  self.__index = self
  return obj
end

function Expanding_effect:update()
  self.x = self.x + self.vx
  self.y = self.y + self.vy
  self.vx = self.vx * 0.85
  self.vy = self.vy * 0.85
  self.age = self.age + 1
  if self.age >= self.lifetime then
    return false
  end
  return true
end
