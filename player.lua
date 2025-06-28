function Player_init()
  Player = {
    x=63,
    y=63,
    fx=false,
    s=1
  }
  Board_bounds = {
    x_min = -1,
    x_max = 122,
    y_min = -2,
    y_max = 120
  }
end

function Player_reset()
  Player.x = 63
  Player.y = 63
  Player.fx = false
  Player.s = 1
end

function Player_top()
  return Player.y > Board_bounds.y_min
end

function Player_bottom()
  return Player.y < Board_bounds.y_max
end

function Player_left()
  return Player.x > Board_bounds.x_min
end

function Player_right()
  return Player.x < Board_bounds.x_max
end

function Player_move_down()
  Player.y = Player.y + 1
  Player.s = 2
end

function Player_move_up()
  Player.y = Player.y - 1
  Player.s = 3
end

function Player_move_left()
  Player.fx = true
  Player.s = 1
  Player.x = Player.x - 1
end

function Player_move_right()
  Player.fx = false
  Player.s = 1
  Player.x = Player.x + 1
end

function Player_move(direction)
  if direction == "right" and Player_right() then
    Player_move_right()
  elseif direction == "left" and Player_left() then
    Player_move_left()
  elseif direction == "down" and Player_bottom() then
    Player_move_down()
  elseif direction == "up" and Player_top() then
    Player_move_up()
  elseif direction == "up_left" then
    if Player_top() and Player_left() then
      Player.y = Player.y - 0.707
      Player.x = Player.x - 0.707
      Player.s = 3
    elseif Player_top() then
      Player_move_up()
    elseif Player_left() then
      Player_move_left()
    end
  elseif direction == "up_right" then
    if Player_top() and Player_right() then
      Player.y = Player.y - 0.707
      Player.x = Player.x + 0.707
      Player.s = 3
    elseif Player_top() then
      Player_move_up()
    elseif Player_right() then
      Player_move_right()
    end
  elseif direction == "down_left" then
    if Player_bottom() and Player_left() then
      Player.y = Player.y + 0.707
      Player.x = Player.x - 0.707
      Player.s = 2
    elseif Player_bottom() then 
      Player_move_down()
    elseif Player_left() then
      Player_move_left()
    end
  elseif direction == "down_right" then
    if Player_bottom() and Player_right() then
      Player.y = Player.y + 0.707
      Player.x = Player.x + 0.707
      Player.s = 2
    elseif Player_bottom() then
      Player_move_down()
    elseif Player_right() then
      Player_move_right()
    end
  end
end
function Player_button_pressed()
  ---@diagnostic disable-next-line: undefined-global
  if btn(➡️) and not btn(⬇️) and not btn(⬆️) then
    Player_move(Directions.➡️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(⬅️) and not btn(⬇️) and not btn(⬆️) then
    Player_move(Directions.⬅️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(⬇️) and not btn(⬅️) and not btn(➡️) then
    Player_move(Directions.⬇️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(⬆️) and not btn(⬅️) and not btn(➡️) then
    Player_move(Directions.⬆️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(➡️) and btn(⬇️) and not btn(⬆️) then
    Player_move(Directions.↘️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(➡️) and btn(⬆️) and not btn(⬇️) then
    Player_move(Directions.↗️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(⬅️) and btn(⬇️) and not btn(⬆️) then
    Player_move(Directions.↙️)
  end
  ---@diagnostic disable-next-line: undefined-global
  if btn(⬅️) and btn(⬆️) and not btn(⬇️) then
    Player_move(Directions.↖️)
  end

end
function Player_draw()
  spr(Player.s, Player.x, Player.y, 1, 1, Player.fx)
end