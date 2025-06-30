function Draw_game()
  cls(0)
  Starfield(Stars)
  if Player.invulnerable == 0 then
    Draw_sprite(Player)
    Draw_sprite(Player.jet)
  else
    if sin(T / 5) < 0.1 then
      Draw_sprite(Player)
      Draw_sprite(Player.jet)
    end
  end
  Draw_all_sprites(Enemies)
  Draw_all_sprites(Bullets)
  if Player.muzzle > 0 then
    circfill(Player.x + 3, Player.y - 2, Player.muzzle, 7)
    circfill(Player.x + 4, Player.y - 2, Player.muzzle, 7)
  end
  for explosion in all(Explosions) do
    spr(Explosions_frames[explosion.sprite_index], explosion.x, explosion.y, 2, 2)
    explosion.sprite_index = explosion.sprite_index + 1
    if explosion.sprite_index >= #Explosions_frames then
      del(Explosions, explosion)
    end
  end
  print("score: " .. Player.score, 40, 1, 12)
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8,  1)
    else
      spr(26, i * 9 - 8,  1)
    end
  end
end