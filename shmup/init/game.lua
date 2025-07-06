function Init_game()
  music(-1,1000)
  T = 0
  Player = Player:new()
  Enemies = {}
  Explosions = {}
  Particles = {}
  Shwaves = {}
  Sparkes = {}
  Stars = GenerateStarField(100)
  Enemies = { Enemy:new(flr(rnd(120)), rnd(1) + 0.5, 3) }
end