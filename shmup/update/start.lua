function Update_start()
  if btnp(4) or btnp(5) then
    Mode = "wavetext"
    music (-1, 1000) -- stop current music
    Init_wave()
  end
end