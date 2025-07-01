function Update_game()
  Player.sprite = 17
  Player.jet.sprite = Player.jet.sprite + 0.5
  if Player.jet.sprite > 23 then
    Player.jet.sprite = 19
  end
  if btn(0) then
    Player.x = Player.x - Player.speed
    Player.jet.x = Player.jet.x - Player.speed
    Player.sprite = 16
  end
  if btn(1) then
    Player.x = Player.x + Player.speed
    Player.jet.x = Player.jet.x + Player.speed
    Player.sprite = 18
  end
  if btn(2) then
    Player.y = Player.y - Player.speed
    Player.jet.y = Player.jet.y - Player.speed
  end
  if btn(3) then
    Player.y = Player.y + Player.speed
    Player.jet.y = Player.jet.y + Player.speed
  end
  for enemy in all(Enemies) do
    enemy.y = enemy.y + enemy.speed
    enemy.sprite = enemy.sprite + 0.2
    if enemy.sprite >= 11 then
      enemy.sprite = 7
    end
    if enemy.y > 128 + 8 then
      del(Enemies, enemy)
      Spawn_enemy()
    end
  end
  for bullet in all(Bullets) do
    if not bullet:update() then
      del(Bullets, bullet)
    end
  end
  if Player.muzzle > 0 then
    Player.muzzle = Player.muzzle - 1
    if Player.muzzle <= 0 then
      Player.muzzle = 0
    end
  end
  if btn(5) and Player.countdown == 0 then
    sfx(0)
    add(Bullets, Bullet:new(Player.x, Player.y - 10))
    Player.muzzle = 6
    Player.countdown = 4
  end
  if Player.countdown > 0 then
    Player.countdown = Player.countdown - 1
    if Player.countdown <= 0 then
      Player.countdown = 0
    end
  end
  if (Player.x < 8 - 8) then
    Player.x = 8 - 8
    Player.jet.x = Player.x
  end
  if (Player.x > 128 - 8) then
    Player.x = 128 - 8
    Player.jet.x = Player.x
  end
  if (Player.y < 8 - 8) then
    Player.y = 8 - 8
    Player.jet.y = Player.y + 8
  end
  if (Player.y > 128 - 8) then
    Player.y = 128 - 8
    Player.jet.y = Player.y + 8
  end
  if Player.invulnerable <= 0 then
    for enemy in all(Enemies) do
      if Collision(Player, enemy) then
        sfx(1)
        Player.lives = Player.lives - 1
        Player.invulnerable = 60
        del(Enemies, enemy)
        Spawn_enemy()
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
        Player.score = Player.score + 10
        sfx(2)
        local explosion = {
          x = enemy.x - 4,
          y = enemy.y - 4,
          width = 16,
          height = 16,
          sprite_index = 1
        }
        add(Explosions, explosion)
        del(Enemies, enemy)
        del(Bullets, bullet)
        Spawn_enemy()
      end
    end
  end
end