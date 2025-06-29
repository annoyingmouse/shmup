function Draw_game()
  cls(0)
  Starfield(Stars) -- Call the starfield function to draw stars
  spr(Player.sprite, Player.x - 8, Player.y - 8)
  spr(Player.jet.sprite, Player.x - 8, Player.y) -- Draw the player sprite
  -- Draw bullets
  for i = 1, #Bullets do
    local bullet = Bullets[i]
    spr(bullet.sprite, bullet.x - 4, bullet.y - 4)
  end
  if Player.muzzle > 0 then
    circfill(Player.x - 5, Player.y - 10, Player.muzzle, 7) -- Draw a circle around the player
    circfill(Player.x - 4, Player.y - 10, Player.muzzle, 7) -- Draw a circle around the player
  end
  --print("Score: " .. player.score, 8, 8, 7) -- Display the score at the top left corner
  print("score: " .. Player.score, 40, 1, 12)
  for i = 1, 4 do
    if Player.lives >= i then
      spr(25, i * 9 - 8,  1) -- Draw the heart sprite
    else
      spr(26, i * 9 - 8,  1) -- Draw the empty heart sprite
    end
  end
end