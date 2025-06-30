local BlinkT = {5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,6,6,5}
local BlinkI = 1

function Blink()
  BlinkI = (BlinkI % #BlinkT) + 1
  return BlinkT[BlinkI]
end

function Draw_all_sprites(sprites)
  for sprite in all(sprites) do
    Draw_sprite(sprite)
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
