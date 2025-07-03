Expanding_effect = {}
Expanding_effect.__index = Expanding_effect

function Expanding_effect:new(x, y, vx, vy, lifetime, age)
  local instance = {}
  setmetatable(instance, Expanding_effect)
  instance.x = x
  instance.y = y
  instance.vx = vx
  instance.vy = vy
  instance.lifetime = lifetime or 30 -- Default lifetime
  instance.age = age or 0 -- Default age
  return instance
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
