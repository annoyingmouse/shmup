Shwave = {}
Shwave.__index = Shwave

function Shwave.new(x, y, target_radius, speed, colour)
  local self = setmetatable({}, Shwave)
  self.x = x
  self.y = y
  self.radius = 3
  self.colour = colour or 9
  self.target_radius = target_radius or 6
  self.speed = speed or 1
  return self
end

function Shwave:update()
  self.radius = self.radius + self.speed
  if self.radius > self.target_radius then
    return false
  end
  return true
end

function Shwave:draw()
  circ(self.x, self.y, self.radius, self.colour)
end
