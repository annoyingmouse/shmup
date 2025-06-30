Player = nil
Bullets = nil
Stars = nil
Enemies = {}
local mode = nil

function _init()
  mode = "start"
end

function _update()
  if mode == "game" then
    Update_game()
  elseif mode == "start" then
    if btnp(4) or btnp(5) then
      mode = "game"
      Init_game()
    end
  elseif mode == "gameover" then
    if btnp(4) or btnp(5) then
      mode = "start"
    end
  end
end

function _draw()
  if mode == "start" then
    Draw_start()
  elseif mode == "gameover" then
    Draw_over()
  elseif mode == "game" then
    Draw_game()
  end
end
