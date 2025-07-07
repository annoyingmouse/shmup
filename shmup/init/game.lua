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
  Spawn_enemy()
end