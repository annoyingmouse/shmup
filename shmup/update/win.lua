function Update_win()
  if btn(4) == false and btn(5) == false then
    Button_released = true
  end
  if Button_released and (btnp(4) or btnp(5)) then
    Button_released = false
    Mode = "start"
    music(1)
    return
  end
end