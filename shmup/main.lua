Player = nil
Bullets = nil
Stars = nil
Enemies = {}
Mode = nil
Explosions = {}

function _init()
  Mode = "start"
end

function _update()
  if Mode == "game" then
    Update_game()
  elseif Mode == "start" then
    if btnp(4) or btnp(5) then
      Mode = "game"
      Init_game()
    end
  elseif Mode == "gameover" then
    if btnp(4) or btnp(5) then
      Mode = "start"
    end
  end
end

function _draw()
  if Mode == "start" then
    Draw_start()
  elseif Mode == "gameover" then
    Draw_over()
  elseif Mode == "game" then
    Draw_game()
  end
end
