Player = {}
setmetatable(Player, Dimensions)

function Player:new()
  local obj = Dimensions:new(56, 56, 8, 8)
  obj.sprite_index = 2
  obj.sprites = {16, 17, 18}
  obj.speed = 2
  obj.muzzle = 0
  obj.countdown = 4
  obj.invulnerable = 0
  obj.jet = Jet:new(56, 64)
  obj.score = 0
  obj.lives = 4
  obj.wave = 1
  obj.wave_timer = 80
  obj.missed_shots = 0
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Player:update()
  if self.invulnerable > 0 then
    self.invulnerable = self.invulnerable - 1
  end
  self.jet.sprite_index = self.jet.sprite_index + 0.5
  if self.jet.sprite_index > #self.jet.sprites then
    self.jet.sprite_index = 1
  end
  if self.muzzle > 0 then
    self.muzzle = self.muzzle - 1
    if self.muzzle <= 0 then
      self.muzzle = 0
    end
  end
  self.jet:setX(self:getX())
  self.jet:setY(self:getY() + 8)
  if btn(0) then
    self:setX(max(self:getX() - self.speed, 8 - self:getWidth()))
    self.jet:setX(self:getX())
    self.sprite_index = 1
  elseif btn(1) then
    self:setX(min(self:getX() + self.speed, 128 - self:getWidth()))
    self.jet:setX(self:getX())
    self.sprite_index = 3
  else
    self.sprite_index = 2
  end

  if btn(2) then
    self:setY(max(self:getY() - self.speed, 8 - self:getHeight()))
    self.jet:setY(self:getY() + 8)
  elseif btn(3) then
    self:setY(min(self:getY() + self.speed, 128 - self:getHeight()))
    self.jet:setY(self:getY() + 8)
  end

  if btn(5) and self.countdown == 0 then
    self:shoot()
  end
  if self.countdown > 0 then
    self.countdown = self.countdown - 1
    if self.countdown <= 0 then
      self.countdown = 0
    end
  end
  Player.jet:update()
end

function Player:shoot()
  if self.countdown == 0 then
    sfx(0)
    add(Bullets, Bullet:new(self.x, self.y - 10))
    self.muzzle = 6
    self.countdown = 4
  end
end

function Player:draw()
  if self.invulnerable == 0 or sin(T / 5) < 0.1 then
    spr(
      self.sprites[flr(self.sprite_index)],
      self:getX(),
      self:getY(),
      flr(self:getWidth() / 8),
      flr(self:getHeight() / 8)
    )
    Player.jet:draw()
  end
  if self.muzzle > 0 then
    circfill(
      self:getX() + 3,
      self:getY() - 2,
      self.muzzle,
      7
    )
    circfill(
      self:getX() + 4,
      self:getY() - 2,
      self.muzzle,
      7
    )
  end
end