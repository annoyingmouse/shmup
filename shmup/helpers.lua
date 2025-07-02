BlinkT = {5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,6,6,5}
BlinkI = 1

function Blink()
  BlinkI = (BlinkI % #BlinkT) + 1
  return BlinkT[BlinkI]
end

function Invoke_draw_for_all(elements)
  for element in all(elements) do
    element:draw()
  end
end

function Collision(sprite1, sprite2)
  if sprite1.x >= sprite2.x + sprite2.width then
    return false
  end
  if sprite1.x + sprite1.width <= sprite2.x then
    return false
  end
  if sprite1.y >= sprite2.y + sprite2.height then
    return false
  end
  if sprite1.y + sprite1.height <= sprite2.y then
    return false
  end
  return true
end