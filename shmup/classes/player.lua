Player = {}

function Player:new()
  local obj = {
    x = 64 - 8,
    y = 64 - 8,
    sprite_index = 2,
    sprites = {16, 17, 18},
    width = 8,
    height = 8,
    speed = 2,
    muzzle = 0,
    countdown = 4,
    invulnerable = 0,
    jet = {
      x = 64 - 8,
      y = 64,
      width = 8,
      height = 8,
      sprite_index = 1,
      sprites = {19, 20, 21, 22, 23},
    },
    score = 0,
    lives = 4
  }
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
  self.jet.x = self.x
  self.jet.y = self.y + 8
  if btn(0) then
    self.x = max(self.x - self.speed, 8 - self.width)
    self.jet.x = self.x
    self.sprite_index = 1
  elseif btn(1) then
    self.x = min(self.x + self.speed, 128 - self.width)
    self.jet.x = self.x
    self.sprite_index = 3
  else
    self.sprite_index = 2
  end

  if btn(2) then
    self.y = max(self.y - self.speed, 8 - self.height)
    self.jet.y = self.y + 8
  elseif btn(3) then
    self.y = min(self.y + self.speed, 128 - self.height)
    self.jet.y = self.y + 8
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
    spr(self.sprites[self.sprite_index], self.x, self.y, flr(self.width / 8), flr(self.height / 8))
    spr(self.jet.sprites[flr(self.jet.sprite_index)], self.jet.x, self.jet.y, flr(self.jet.width / 8), flr(self.jet.height / 8))
  end
  if self.muzzle > 0 then
    circfill(self.x + 3, self.y - 2, self.muzzle, 7)
    circfill(self.x + 4, self.y - 2, self.muzzle, 7)
  end
end