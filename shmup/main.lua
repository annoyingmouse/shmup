local player = nil
local bullets = nil

function _init()
  cls(0)
  player = {
    x = 64,
    y = 64,
    sprite = 16, -- 2 or 17 is the default sprite for the player
    speed = 2
  }
  bullets = {}
end

function _update() -- 30 times a second
  -- Handle player movement
  player.sprite = 17 -- Reset to default sprite
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
  -- Handle shooting
  if btnp(5) then 
    -- Fire a bullet
    local bullet = {
      x = player.x-4,
      y = player.y-8, -- Start above the player
      sprite = 4, -- 4 is the bullet sprite
      speed = 4
    }
    sfx(0) -- Reset the sprite to the default
    add(bullets, bullet)
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
  -- Draw bullets
  for i = 1, #bullets do
    local bullet = bullets[i]
    spr(bullet.sprite, bullet.x - 4, bullet.y - 4)
  end
end
