Particle = {}

function Particle:new(x, y, vx, vy, size, lifetime, age, blue)
  local obj = {
    x = x,
    y = y,
    vx = vx,
    vy = vy,
    size = size or 2, -- Default size
    lifetime = lifetime or 30, -- Default lifetime of 30 frames
    colour = 7, -- Default color
    age = age or 0,
    blue = blue or false -- Flag to indicate if the particle is from the player, defaults to false
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Particle:set_colour(blue)
  --[[http://lua-users.org/wiki/TernaryOperator]]--
  self.colour = 7 -- reset default colour
  if self.age > 5 then
    self.colour = blue and 6 or 10
  end
  if self.age > 7 then
    self.colour = blue and 12 or 9
  end
  if self.age > 10 then
    self.colour = blue and 13 or 8
  end
  if self.age > 12 then
    self.colour = blue and 1 or 2
  end
  if self.age > 15 then
    self.colour = blue and 1 or 5
  end
end

function Particle:update()
  self.x = self.x + self.vx
  self.y = self.y + self.vy
  self.vx = self.vx * 0.85
  self.vy = self.vy * 0.85
  self.age = self.age + 1
  self:set_colour(self.blue)
  if self.age >= self.lifetime then
    self.size = self.size - 0.5
    if self.size <= 0 then
      return false
    end
  end
  return true
end

function Particle:draw()
  circfill(self.x , self.y, self.size, self.colour)
end

