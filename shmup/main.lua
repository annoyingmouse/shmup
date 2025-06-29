local Player = nil
local Bullets = nil
local Stars = nil
local mode = nil -- Game mode, can be "game", "start", or "gameover"

function _init()
  cls(0) -- Clear the screen
  mode = "start" -- Set the initial mode to start
end

function _update() -- 30 times a second

  if mode == "game" then
    Update_game() -- Call the update_game function to handle player and bullet movement
  elseif mode == "start" then
    if btnp(4) or btnp(5) then
      mode = "game"
      Init_game()
    end
  elseif mode == "gameover" then
    -- Handle game over updates here
    if btnp(4) or btnp(5) then
      mode = "start"
    end
  end

end

function _draw()
  if mode == "start" then
    Draw_start() -- Call the draw_start function to display the start screen
  elseif mode == "gameover" then
    Draw_over()
  elseif mode == "game" then
    Draw_game()
  end
end
