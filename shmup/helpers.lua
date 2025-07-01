BlinkT = {5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,6,6,5}
BlinkI = 1
Explosions_frames = {64, 64, 66, 66, 66, 68, 68, 70, 70, 72}

function Blink()
  BlinkI = (BlinkI % #BlinkT) + 1
  return BlinkT[BlinkI]
end

function Draw_all_sprites(sprites)
  for sprite in all(sprites) do
    Draw_sprite(sprite)
  end
end

function Draw_all_classes(sprites)
  for sprite in all(sprites) do
    sprite:draw()
  end
end

function Draw_sprite(sprite)
  spr(
    sprite.sprite,
    sprite.x,
    sprite.y,
    flr(sprite.width / 8),
    flr(sprite.height / 8)
  )
end

function Collision(sprite1, sprite2)
  return sprite1.x < sprite2.x + sprite2.width and
         sprite1.x + sprite1.width > sprite2.x and
         sprite1.y < sprite2.y + sprite2.height and
         sprite1.y + sprite1.height > sprite2.y
end

function Spawn_enemy()
  local enemy = {
    x = flr(rnd(120)),
    y = -8,
    width = 8,
    height = 8,
    sprite = 7,
    speed = rnd(1) + 0.5 -- Random speed between 0.5 and 1.5
  }
  add(Enemies, enemy)
end
