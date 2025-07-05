function Draw_game()
  cls(0)
  Starfield(Stars)
  Player:draw()
  Invoke_draw_for_all(Enemies)
  Invoke_draw_for_all(Bullets)
  -- Invoke_draw_for_all(Explosions)
  Invoke_draw_for_all(Particles)
  Invoke_draw_for_all(Shwaves)
  Invoke_draw_for_all(Sparkes)
  Printc("score: " .. Player.score, 1, 12)
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8,  1)
    else
      spr(26, i * 9 - 8,  1)
    end
  end
end