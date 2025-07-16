Star = {}
setmetatable(Star, Coordinates)

function Star:new(x, y, speed)
  local obj = Coordinates:new(x, y)
  obj.speed = speed or 1
  obj.colour = 6
  if speed < 1 then
    obj.colour = 1 -- Much dimmer colour for slower stars
  elseif speed < 1.25 then
    obj.colour = 13 -- Dimmer colour for slower stars
  end
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Star:update()
  self.y = (self.y + self.speed) % 128 -- Move stars vertically
  self:draw()
end

function Star:draw()
  pset(self.x, self.y, self.colour)
end

function GenerateStarField(star_num)
  local starfield = {}
  for i = 1, star_num do
    local star = Star:new(flr(rnd(128)), flr(rnd(128)), rnd(1) + 0.5) -- Random speed between 0.5 and 1.5
    add(starfield, star)
  end
  return starfield
end

function Starfield(stars)
  for star in all(stars) do
    star:update()
  end
end