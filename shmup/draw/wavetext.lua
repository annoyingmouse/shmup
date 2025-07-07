function Draw_wavetext()
  Draw_game()
  Printc("wave " .. Player.wave, 40, Blink())
  if Player.wave_timer > 0 then
    Player.wave_timer = Player.wave_timer - 1
  end
  if Player.wave_timer == 0 then
    Mode = "game"
    Spawn_enemy()
  end
end