function Draw_win()
  cls(0)
  Player:update()
  Starfield(Stars)
  if Player.lives > 0 then
    Player:draw()
  end
  Printc("congratulations", 40, 12)
  Printc("press any key to continue", 80, Blink())
  Invoke_draw_for_all(Shwaves)
  Invoke_draw_for_all(Sparkes)
  Invoke_draw_for_all(Particles)
end