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
    end
  end
  for bullet in all(Bullets) do
    bullet.y = bullet.y - bullet.speed
    if bullet.sprite < 6 then
      bullet.sprite = bullet.sprite + 0.1
    end
    if bullet.y < -8 then
      del(Bullets, bullet)
    end
  end
  if Player.muzzle > 0 then
    Player.muzzle = Player.muzzle - 1
    if Player.muzzle <= 0 then
      Player.muzzle = 0
    end
  end
  if btnp(5) then
    local bullet = {
      x = Player.x,
      y = Player.y-10,
      sprite = 4,
      speed = 4
    }
    sfx(0)
    add(Bullets, bullet)
    Player.muzzle = 6
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
end