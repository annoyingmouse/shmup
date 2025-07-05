function Init_game()
  T = 0
  Player = Player:new()
  Bullets = {}
  Particles = {}
  Stars = GenerateStarField(100)
  Enemies = { Enemy:new(flr(rnd(120)), rnd(1) + 0.5, 3) }
end