function Update_win()
  for particle in all(Particles) do
    if not particle:update() then
      del(Particles, particle)
    end
  end
  for shwave in all(Shwaves) do
    if not shwave:update() then
      del(Shwaves, shwave)
    end
  end
  for spark in all(Sparkes) do
    if not spark:update() then
      del(Sparkes, spark)
    end
  end
  if btn(4) == false and btn(5) == false then
    Button_released = true
  end
  if Button_released and (btnp(4) or btnp(5)) then
    Button_released = false
    Mode = "start"
    music(1)
    return
  end
end