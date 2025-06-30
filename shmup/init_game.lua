function Init_game()
  Player = {
    x = 64 - 8,
    y = 64 - 8,
    sprite = 16,
    speed = 2,
    muzzle = 0,
    jet = {
      x = 64 - 8,
      y = 64,
      sprite = 19,
    },
    score = 0,
    lives = 3
  }
  Bullets = {}
  Stars = GenerateStarField(100)
  local enemy = {
    x = 60 - 8,
    y = 5 - 8,
    sprite = 7,
    speed = 1
  }
  add(Enemies, enemy)
end