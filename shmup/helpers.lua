local BlinkT = {5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,6,6,5}
local BlinkI = 1

function Blink()
  BlinkI = (BlinkI % #BlinkT) + 1
  return BlinkT[BlinkI]
end
