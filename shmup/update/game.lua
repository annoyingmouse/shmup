function Update_game()
  Player:update()
  for enemy in all(Enemies) do
    if not enemy:update() then
      del(Enemies, enemy)
      Spawn_enemy()
    end
  end
  for bullet in all(Bullets) do
    if not bullet:update() then
      del(Bullets, bullet)
      Player.missed_shots = Player.missed_shots + 1
    end
  end
  for particle in all(Particles) do
    if not particle:update() then
      del(Particles, particle)
    end
  end
  for shwave in all(Shwaves) do
    if not shwave:update() then
      del(Shwaves, shwave)
    end
  end
  for spark in all(Sparkes) do
    if not spark:update() then
      del(Sparkes, spark)
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
          Player.score = Player.score + 15
          sfx(2)
          Create_particle_storm(enemy, false)
          Player.score = Player.score + 10
          del(Enemies, enemy)
          Spawn_enemy()
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
    music(6)
    return
  end
  for enemy in all(Enemies) do
    for bullet in all(Bullets) do
      if Collision(enemy, bullet) then
        if enemy.lives > 1 then
          enemy.lives = enemy.lives - 1
          enemy.flash = 5
          Player.score = Player.score + 5
          add(Shwaves, Shwave:new(bullet:getX() + 4, bullet:getY() + 4))
          add(Sparkes, Spark:new(
            enemy.x + enemy.width / 2,
            enemy.y + enemy.height / 2,
            (rnd() - 0.5) * 8,
            (rnd() - 1) * 3,
            10 + rnd(10),
            1 + rnd(2)
          ))
        else
          Player.score = Player.score + 10
          sfx(2)
          Create_particle_storm(enemy, false)
          Create_spark_storm(enemy)
          add(Shwaves, Shwave:new(enemy.x + 4, enemy.y + 4, 25, 3.5, 7))
          del(Enemies, enemy)
          if #Enemies == 0 then
            Player.wave = Player.wave + 1
            if Player.wave > 5 then
              Mode = "win"
            else
              Player.wave_timer = 80
              Mode = "wavetext"
            end
          end
        end
        del(Bullets, bullet)
      end
    end
  end
end