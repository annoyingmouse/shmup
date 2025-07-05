function Draw_wavetext()
  Draw_game()
  Printc("wave " .. Player.wave, 40, Blink())
  if Player.wave_timer > 0 then
    Player.wave_timer = Player.wave_timer - 1
  end
  if Player.wave_timer == 0 then
    Mode = "game"
    Enemies = { Enemy:new(flr(rnd(120)), rnd(1) + 0.5, 3) }
  end
end