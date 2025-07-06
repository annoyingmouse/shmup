Particle = {}

function Particle:new(x, y, radius, speed, colour, life)
  local obj = {
    x = x or 0,
    y = y or 0,
    radius = radius or 1,
    speed = speed or 1,
    colour = colour or 10,
    life = life or 10
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Particle:update(Force)
  self.y = self.y - self.speed
  self.x = self.x + Force
  self.life = self.life - 1
  self.radius = self.radius - 0.1
  if self.life < 14 then
    self.colour = 10
  end
  if self.life < 7 then
    self.colour = 9
  end
  if self.life < 0 then
    return false
  end
  return true
end

function Particle:draw()
  circfill(self.x , self.y, self.radius, self.colour)
end