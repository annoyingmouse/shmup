Spark = {}
Spark.__index = Spark
setmetatable(Spark, Expanding_effect)

function Spark:new(x, y, vx, vy, lifetime, age, colour)
  local instance = Expanding_effect:new(x, y, vx, vy, lifetime, age)
  instance.colour = colour or 7
  setmetatable(instance, self)
  return instance
end

function Spark:draw()
  pset(self.x, self.y, self.colour)
end