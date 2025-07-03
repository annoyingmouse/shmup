Spark = {}
Spark.__index = Spark
setmetatable(Spark, Expanding_effect)

function Spark:new(x, y, vx, vy, lifetime, age, colour)
  local obj = Expanding_effect:new(x, y, vx, vy, lifetime, age)
  obj.colour = colour or 7
  setmetatable(obj, Spark)
  return obj
end

function Spark:draw()
  pset(self.x, self.y, self.colour)
end