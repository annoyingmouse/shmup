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
  spr(sprite.sprite, sprite.x, sprite.y)
end

