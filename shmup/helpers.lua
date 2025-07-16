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
  if sprite1:getX() >= sprite2:getX() + sprite2:getWidth() then
    return false
  end
  if sprite1:getX() + sprite1:getWidth() <= sprite2:getX() then
    return false
  end
  if sprite1:getY() >= sprite2:getY() + sprite2:getHeight() then
    return false
  end
  if sprite1:getY() + sprite1:getHeight() <= sprite2:getY() then
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
    add(Enemies, Enemy_red_guy:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  elseif Player.wave == 3 then
    add(Enemies, Enemy_fly:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  elseif Player.wave == 4 then
    add(Enemies, Enemy_spinner:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  elseif Player.wave == 5 then
    add(Enemies, Enemy_boss:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  else
    add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, 3))
  end
end