function GenerateStarField(star_num)
  local starfield = {}
  for i = 1, star_num do
    local star = {
      x = flr(rnd(128)),
      y = flr(rnd(128)),
      speed = rnd(1) + 0.5 -- Random speed between 0.5 and 1.5
    }
    add(starfield, star)
  end
  return starfield
end

function Starfield(stars)
  for star in all(stars) do
    local star_colour = 6
    if star.speed < 1.25 then
      star_colour = 13 -- Dimmer colour for slower stars
    elseif star.speed < 1 then
      star_colour = 1 -- Much dimmer colour for slower stars
    end
    pset(star.x, star.y, star_colour)
    star.y = (star.y + star.speed) % 128 -- Move stars vertically
  end
end