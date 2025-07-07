Jet = {}
setmetatable(Jet, Coordinates)

function Jet:new(x, y)
  local obj = Coordinates:new(x, y)
  obj.width = 8
  obj.height = 8
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
  self.x = Player.x
  self.y = Player.y + 8
end

function Jet:draw()
  spr(self.sprites[flr(self.sprite_index)], self.x, self.y, flr(self.width / 8), flr(self.height / 8))
end