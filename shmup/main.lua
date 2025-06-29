local player = nil
local bullets = nil

function _init()
  cls(0)
  player = {
    x = 64,
    y = 64,
    sprite = 16, -- 2 or 17 is the default sprite for the player
    speed = 2,
    muzzle = 0, -- Muzzle flash sprite
    jet = {
      sprite = 19, -- 19 is the jet sprite
    },
    score = 10000,
    lives = 3
  }
  bullets = {}
end

function _update() -- 30 times a second
  -- Handle player movement
  player.sprite = 17 -- Reset to default sprite
  player.jet.sprite = player.jet.sprite + 0.5
  if player.jet.sprite > 23 then
    player.jet.sprite = 19 -- Reset the jet sprite after it reaches a certain point
  end
  if btn(0) then 
    player.x = player.x - player.speed 
    player.sprite = 16 -- 1 is the left-facing sprite
  end
  if btn(1) then 
    player.x = player.x + player.speed
    player.sprite = 18 -- 3 is the right-facing sprite
  end
  if btn(2) then 
    player.y = player.y - player.speed
  end
  if btn(3) then 
    player.y = player.y + player.speed
  end
  -- Handle bullet movement
  for i = #bullets, 1, -1 do
    local bullet = bullets[i]
    bullet.y = bullet.y - bullet.speed -- Move the bullet up
    if bullet.sprite < 6 then
      bullet.sprite = bullet.sprite + 0.1 -- Change the sprite to a different one when moving
    end
    -- Check if the bullet is off-screen
    if bullet.y < 0 then
      del(bullets, bullet) -- Remove the bullet if it goes off-screen
    end
  end
  if player.muzzle > 0 then
    player.muzzle = player.muzzle - 1 -- Decrease the muzzle flash size
    if player.muzzle <= 0 then
      player.muzzle = 0 -- Reset the muzzle flash size
    end
  end
  -- Handle shooting
  if btnp(5) then 
    -- Fire a bullet
    local bullet = {
      x = player.x-4,
      y = player.y-10, -- Start above the player
      sprite = 4, -- 4 is the bullet sprite
      speed = 4
    }
    sfx(0) -- Reset the sprite to the default
    add(bullets, bullet)
    player.muzzle = 5
  end  
  -- check boundaries
  if (player.x < 8) then player.x = 8 end
  if (player.x > 128) then player.x = 128 end
  if (player.y < 8) then player.y = 8 end
  if (player.y > 128) then player.y = 128 end
end

function _draw()
  cls(0)
  spr(player.sprite, player.x - 8, player.y - 8)
  spr(player.jet.sprite, player.x - 8, player.y) -- Draw the player sprite
  -- Draw bullets
  for i = 1, #bullets do
    local bullet = bullets[i]
    spr(bullet.sprite, bullet.x - 4, bullet.y - 4)
  end
  if player.muzzle > 0 then
    circfill(player.x - 5, player.y - 10, player.muzzle, 7) -- Draw a circle around the player
    circfill(player.x - 4, player.y - 10, player.muzzle, 7) -- Draw a circle around the player
  end
  --print("Score: " .. player.score, 8, 8, 7) -- Display the score at the top left corner
  print("Score: " .. player.score, 40, 1, 12)
  for i = 1, 4 do
    if player.lives >= i then
      spr(25, i * 9 - 8,  1) -- Draw the heart sprite
    else
      spr(26, i * 9 - 8,  1) -- Draw the empty heart sprite
    end
  end
end
