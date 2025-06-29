function Update_game() -- 30 times a second
  -- Handle player movement
  Player.sprite = 17 -- Reset to default sprite
  Player.jet.sprite = Player.jet.sprite + 0.5
  if Player.jet.sprite > 23 then
    Player.jet.sprite = 19 -- Reset the jet sprite after it reaches a certain point
  end
  if btn(0) then 
    Player.x = Player.x - Player.speed 
    Player.sprite = 16 -- 1 is the left-facing sprite
  end
  if btn(1) then 
    Player.x = Player.x + Player.speed
    Player.sprite = 18 -- 3 is the right-facing sprite
  end
  if btn(2) then 
    Player.y = Player.y - Player.speed
  end
  if btn(3) then 
    Player.y = Player.y + Player.speed
  end
  -- Handle bullet movement
  for i = #Bullets, 1, -1 do
    local bullet = Bullets[i]
    bullet.y = bullet.y - bullet.speed -- Move the bullet up
    if bullet.sprite < 6 then
      bullet.sprite = bullet.sprite + 0.1 -- Change the sprite to a different one when moving
    end
    -- Check if the bullet is off-screen
    if bullet.y < -8 then
      del(Bullets, bullet) -- Remove the bullet if it goes off-screen
    end
  end
  if Player.muzzle > 0 then
    Player.muzzle = Player.muzzle - 1 -- Decrease the muzzle flash size
    if Player.muzzle <= 0 then
      Player.muzzle = 0 -- Reset the muzzle flash size
    end
  end
  -- Handle shooting
  if btnp(5) then 
    -- Fire a bullet
    local bullet = {
      x = Player.x-4,
      y = Player.y-10, -- Start above the player
      sprite = 4, -- 4 is the bullet sprite
      speed = 4
    }
    sfx(0) -- Reset the sprite to the default
    add(Bullets, bullet)
    Player.muzzle = 6
  end  
  -- check boundaries
  if (Player.x < 8) then Player.x = 8 end
  if (Player.x > 128) then Player.x = 128 end
  if (Player.y < 8) then Player.y = 8 end
  if (Player.y > 128) then Player.y = 128 end
end