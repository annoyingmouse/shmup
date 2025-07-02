function Draw_game()
  cls(0)
  Starfield(Stars)
  Player:draw()
  Invoke_draw_for_all(Enemies)
  Invoke_draw_for_all(Bullets)
  Invoke_draw_for_all(Explosions)
  print("score: " .. Player.score, 40, 1, 12)
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8,  1)
    else
      spr(26, i * 9 - 8,  1)
    end
  end
end