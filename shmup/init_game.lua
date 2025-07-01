function Init_game()
  T = 0
  Player = {
    x = 64 - 8,
    y = 64 - 8,
    sprite = 16,
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
      sprite = 19,
    },
    score = 0,
    lives = 4
  }
  Bullets = {}
  Stars = GenerateStarField(100)
  Enemies = { Enemy:new(flr(rnd(120)), rnd(1) + 0.5) }
end