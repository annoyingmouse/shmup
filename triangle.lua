T = {
  {63, 0},
  {0, 127},
  {127, 127}
}
local function midPoint(p1, p2)
  return {(p1[1] + p2[1]) / 2, (p1[2] + p2[2]) / 2}
end


function _init()
  cls(7)
  Current = {63, 63}
  pset(Current[1], Current[2], 0)
end

function _update()
  To = rnd(T)
  Current = midPoint(Current, To)
  while pget(Current[1], Current[2]) == 0 do
    To = rnd(T)
    Current = midPoint(Current, To)
  end
end

function _draw()
  pset(Current[1], Current[2], 0)
end