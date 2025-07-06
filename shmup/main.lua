Player = nil
Bullets = nil
Stars = nil
Enemies = {}
Mode = nil
Explosions = {}
Particles = {}
Shwaves = {}
Sparkes = {}
Button_released = false
T = 0

function _init()
  Mode = "start"
  music(1)
end

function _update()
  T = T + 1
  if Mode == "game" then
    Update_game()
  elseif Mode == "start" then
    Update_start()
  elseif Mode == "wavetext" then
    Update_game()
  elseif Mode == "win" then
    Update_win()
  elseif Mode == "gameover" then
    Update_over()
  end
end

function _draw()
  if Mode == "game" then
    Draw_game()
  elseif Mode == "start" then
    Draw_start()
  elseif Mode == "wavetext" then
    Draw_wavetext()
  elseif Mode == "win" then
    Draw_win()
  elseif Mode == "gameover" then
    Draw_over()
  end
end
