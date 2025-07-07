BlinkT = {5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,6,6,5}
BlinkI = 1

function Blink()
  BlinkI = (BlinkI % #BlinkT) + 1
  return BlinkT[BlinkI]
end

function Invoke_draw_for_all(elements)
  for element in all(elements) do
    element:draw()
  end
end

function Create_particle_storm(element, player)
  add(Particles, Particle:new(element.x + element.width / 2, element.y + element.height / 2, 0, 0, 0, 0, 10))
  for i = 1, 20 do
    add(Particles, Particle:new(
      element.x + element.width / 2,
      element.y + element.height / 2,
      (rnd() - 0.5) * 10,
      (rnd() - 0.5) * 10,
      10 + rnd(10),
      rnd(2),
      1 + rnd(2),
      player or false
    ))
  end
end

function Create_spark_storm(element)
  for i = 1, 20 do
    add(Sparkes, Spark:new(
      element.x + element.width / 2,
      element.y + element.height / 2,
      (rnd() - 0.5) * 10,
      (rnd() - 0.5) * 10,
      10 + rnd(10),
      1 + rnd(2)
    ))
  end
end

function Collision(sprite1, sprite2)
  if sprite1.x >= sprite2.x + sprite2.width then
    return false
  end
  if sprite1.x + sprite1.width <= sprite2.x then
    return false
  end
  if sprite1.y >= sprite2.y + sprite2.height then
    return false
  end
  if sprite1.y + sprite1.height <= sprite2.y then
    return false
  end
  return true
end

-- centered printing

-- width of a printed string
function Printw(s)
  if #s == 0 then
    return 0
  end

  local width = 0
  for i = 1, #s do
    if sub(s,i,i) >= "\x80" then
      width = width + 7
    else 
      width = width + 3
    end
  end

  return width + #s - 1
end

-- print centered
function Printc(s, y, colour)
  print(s, 64 - Printw(s)/2, y, colour or 7)
end

function Spawn_enemy()
  if Player.wave == 2 then
    add(Enemies, Enemy_001:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  elseif Player.wave == 3 then
    add(Enemies, Enemy_002:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  elseif Player.wave == 4 then
    add(Enemies, Enemy_003:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  else
    add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  end
end