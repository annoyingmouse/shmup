function Update_game()
  Player:update()
  for enemy in all(Enemies) do
    if not enemy:update() then
      del(Enemies, enemy)
      add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, flr(rnd(3))+1))  
    end
  end
  for bullet in all(Bullets) do
    if not bullet:update() then
      del(Bullets, bullet)
    end
  end
  for particle in all(Particles) do
    if not particle:update() then
      del(Particles, particle)
    end
  end
  if Player.invulnerable <= 0 then
    for enemy in all(Enemies) do
      if Collision(Player, enemy) then
        Create_particle_storm(Player, true)
        sfx(1)
        Player.lives = Player.lives - 1
        Player.invulnerable = 60
        if enemy.lives > 1 then
          enemy.lives = enemy.lives - 1
          enemy.flash = 5
        else
          Player.score = Player.score + 10
          sfx(2)
          Create_particle_storm(enemy)
          Player.score = Player.score + 10
          del(Enemies, enemy)
          add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, flr(rnd(3))+1))
        end
      end
    end
  else
    Player.invulnerable = Player.invulnerable - 1
    if Player.invulnerable <= 0 then
      Player.invulnerable = 0
    end
  end
  if Player.lives <= 0 then
    Mode = "gameover"
  end
  for enemy in all(Enemies) do
    for bullet in all(Bullets) do
      if Collision(enemy, bullet) then
        if enemy.lives > 1 then
          enemy.lives = enemy.lives - 1
          enemy.flash = 5
        else
          Player.score = Player.score + 10
          sfx(2)
          Create_particle_storm(enemy)
          del(Enemies, enemy)
          add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, flr(rnd(3))+1))
        end
        del(Bullets, bullet)
      end
    end
  end
end