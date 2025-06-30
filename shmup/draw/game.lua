function Draw_game()
  cls(0)
  Starfield(Stars)
  Draw_sprite(Player)
  Draw_sprite(Player.jet)
  Draw_all_sprites(Enemies)
  Draw_all_sprites(Bullets)
  if Player.muzzle > 0 then
    circfill(Player.x + 3, Player.y - 2, Player.muzzle, 7)
    circfill(Player.x + 4, Player.y - 2, Player.muzzle, 7)
  end
  print("score: " .. Player.score, 40, 1, 12)
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8,  1)
    else
      spr(26, i * 9 - 8,  1)
    end
  end
  for explosion in all(Explosions) do
    spr(explosion.sprite, explosion.x, explosion.y)
    explosion.sprite = explosion.sprite + 0.2
    if explosion.sprite >= 48 then
      del(Explosions, explosion)
    end
  end
end