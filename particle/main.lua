function _init()
  Particles = {}
  Force = 0
  Force_direction = 0.2
end

function _update()
  if Force < -0.5 or Force > rnd(0.5) then
    Force_direction = Force_direction * -1
  end
  Force = Force + Force_direction
  for particle in all(Particles) do
    if not particle:update(Force) then
      del(Particles, particle)
    end
  end


  for i=1, 20 do
    add(Particles, Particle:new(
      (64 - (5 / 2)) + rnd(5), -- x
      80 + rnd(5),            -- y
      rnd(3),                  -- radius
      1,                       -- speed
      7,                       -- colour
      rnd(25)                  -- life
    ))
  end
end

function _draw()
  cls(0)
  spr(1, 56, 77, 2, 2)
  for particle in all(Particles) do
    particle:draw()
  end
end