Shwave = {}
setmetatable(Shwave, Coordinates)

function Shwave:new(x, y, target_radius, speed, colour)
  local obj = Coordinates:new(x, y)
  obj.radius = 3
  obj.colour = colour or 9
  obj.target_radius = target_radius or 6
  obj.speed = speed or 1
  setmetatable(obj, self)
  self.__index = self
  return obj
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
