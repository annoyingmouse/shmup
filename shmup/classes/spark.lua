Spark = {}

function Spark:new(x, y, vx, vy, lifetime, age, colour)
  local spark = {
    x = x,
    y = y,
    vx = vx,
    vy = vy,
    lifetime = lifetime or 30,
    age = age or 0,
    colour = colour or 7
  }
  setmetatable(spark, self)
  self.__index = self
  return spark
end

function Spark:update()
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

function Spark:draw()
  pset(self.x, self.y, self.colour)
end