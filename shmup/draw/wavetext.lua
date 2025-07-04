function Draw_wavetext()
  cls(0)

  -- Draw the wave text
  local wave_text = "Wave: " .. Player.wave
  local x = (128 - #wave_text * 4) / 2
  local y = 64
  print(wave_text, x, y, 12)

  -- Draw the player score
  print("Score: " .. Player.score, 40, 1, 12)

  -- Draw player lives
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8, 1)
    else
      spr(26, i * 9 - 8, 1)
    end
  end
end