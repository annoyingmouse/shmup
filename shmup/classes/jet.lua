Jet = {}
setmetatable(Jet, Dimensions)

function Jet:new(x, y)
  local obj = Dimensions:new(x, y, 8, 8)
  obj.sprite_index = 1
  obj.sprites = {19, 20, 21, 22, 23}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Jet:update()
  self.sprite_index = self.sprite_index + 0.5
  if self.sprite_index > #self.sprites then
    self.sprite_index = 1
  end
  self:setX(Player.x)
  self:setY(Player.y + 8)
end

function Jet:draw()
  spr(
    self.sprites[flr(self.sprite_index)],
    self:getX(),
    self:getY(),
    flr(self:getWidth() / 8),
    flr(self:getHeight() / 8)
  )
end