function Init_game()
  Player = {
    x = 64,
    y = 64,
    sprite = 16, -- 2 or 17 is the default sprite for the player
    speed = 2,
    muzzle = 0, -- Muzzle flash sprite
    jet = {
      sprite = 19, -- 19 is the jet sprite
    },
    score = 0, -- Player's score
    lives = 3
  }
  Bullets = {}
  Stars = GenerateStarField(100) -- Generate the starfield
end