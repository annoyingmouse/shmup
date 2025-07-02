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
  for explosion in all(Explosions) do
    if not explosion:update() then
      del(Explosions, explosion)
    end
  end
  if Player.invulnerable <= 0 then
    for enemy in all(Enemies) do
      if Collision(Player, enemy) then
        sfx(1)
        Player.lives = Player.lives - 1
        Player.invulnerable = 60
        del(Enemies, enemy)
        add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, flr(rnd(3))+1))
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
          add(Explosions, Explosion:new(enemy.x - 4, enemy.y - 4))
          del(Enemies, enemy)
          add(Enemies, Enemy:new(flr(rnd(120)), rnd(1) + 0.5, flr(rnd(3))+1))
        end
        del(Bullets, bullet)
      end
    end
  end
end