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
    countdown = 6,
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
  Enemies = {}
  add(Enemies, {
    x = flr(rnd(120)),
    y = - 8,
    width = 8,
    height = 8,
    sprite = 7,
    speed = 1
  })
end