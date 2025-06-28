local player = nil

function _init()
  cls(0)
  player = {
    x = 64,
    y = 64,
    sprite = 2, -- 2 is the default sprite for the player
    speed = 2
  }
end

function _update() -- 30 times a second
  -- Handle player movement
  player.sprite = 2 -- Reset to default sprite
  if btn(0) then 
    player.x = player.x - player.speed 
    player.sprite = 1 -- 1 is the left-facing sprite
  end
  if btn(1) then 
    player.x = player.x + player.speed
    player.sprite = 3 -- 3 is the right-facing sprite
  end
  if btn(2) then 
    player.y = player.y - player.speed
  end
  if btn(3) then 
    player.y = player.y + player.speed
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
end
