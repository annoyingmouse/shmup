print("DDDD   M   M")
print("D   D  MM MM")
print("D   D  MM MM")
print("D   D  M M M")
print("D   D  M   M")
print("D   D  M   M")
print("DDDD   M   M")

Message = "Lua is awesome!"
Message = 0
Condition = -5

if Condition > 0 then
  Message = 1
else 
  Message = -1
end
if Condition > 0 then
  Message = "Condition is positive"
elseif Condition < -10 then
  Message = "Condition is less than -10"
elseif Condition == -5 then
  Message = "Condition is -5"
else
  Message = "NO CONDITIONS MET: Condition less than or equal to zero but not less than -10"
end

print(Message)

Message = 0
while Message < 10 do
  Message = Message + 1
  print("Message is: " .. Message)
end
local name = "Dominic Myers"; print(name)
local age = 52
local first_name = [[Dominic
Myers is age ]] .. age .. [[.]]
print(first_name)
local food = "Orange"
print("My favorite food is " .. food .. ".")
print(#food)
local foods = {
  "Pizza",
  nil,
  "Pasta",
  "Ice Cream",
  "Chocolate",
  "Burgers"
}

print(type(foods))
print(foods)
print(#foods)
print(foods[2])

local foods = {
  fave01 = "Pizza",
  fave02 = "Pasta",
  fave03 = "Ice Cream",
  fave04 = "Chocolate",
  fave05 = "Burgers"
}
print(type(foods))
print(foods.fave01)
print(-4 * 3)
print(math.abs(-4 * 3))
print(5 / 3)
print(math.ceil(5 / 3))
print(math.floor(5 / 3))
print(math.random())
math.randomseed(os.time())
print(math.random())

print(math.max(1,2,3,4))
print(math.min(1,2,3,4))
local first_name = "Dominic"
local last_name = "Myers"
local full_name = first_name .. " " .. last_name
print(full_name)
print(#full_name)
print(string.sub(full_name, 0, 8))
local start_char, end_char = string.find(full_name, "Myers")
print(string.find(full_name, "Myers"))
print([[The first character was found at ]] .. start_char .. [[,  
and the ending character was found at ]] .. end_char .. [[.]])

do
  local first_name = "Katrina"
  print(first_name)
end
print(first_name)

local function do_stuff()
  print("Hello")
end

do_stuff()

function Do_stuff(surname)
  print("Hello Mr. " .. surname)
end
print("*****************")
Do_stuff("Smith")

GetAge = function ()
  local age = 52
  return age
end

GetAge2 = function ()
  print("Your age is 21")
  return function()
    print("Your age was 52, wasn't it?")
  end
end
print("*****************")
print("My age is " .. GetAge())

function Do_stuff(surname, age)
  print("Hello Mr. " .. surname)
  age()
end
print("*****************")
Do_stuff("Jones", GetAge2)
print("*****************")
Do_stuff("Jones", GetAge2())
print("*****************")
function Print_stuff(...)
  local args = {...}
  for i, v in pairs(args) do
    print("Argument " .. i .. ": " .. v)
  end
end
Print_stuff("Hello", "World", 42, "Lua")
print("*****************")
function People()
  return "Dominic", "Katrina", "Oz", "Ash"
end
local p1, p2, p3, p4 = People()
print(p1)
print(p2)
print(p3)
print(p4)
for i=1,10 do print(i) end

local age = 18
if age >= 18 and age < 25 then
  print("You are aligible for a driver's license")
elseif age >=25 then
  print("You are eligible to drive, and have reduced insurance costs")
else
  print("You have a bit longer to wait...")
end

local fav_food = "Orange"
-- local fav_food = "Cake"

if fav_food == "Orange" or fav_food == "Spinach" then
  print("You like healthy food")
else
  print("You like unhealthy food")
end

age = 10
while age < 18 do -- while loop
  print("At " .. age .. " you are not old enough to drive yet... wait a year")
  age = age + 1
end
print("At " .. age .. " you are now eligible for a driving license!")

age = 18
repeat -- always runs at least once
  print("At " .. age .. " you are not old enough to drive yet... wait a year")
  age = age + 1
until  age >= 18
print("At " .. age .. " you are now eligible for a driving license!")

print("*****************")
-- io.write("What is your name? ")
-- first_name = io.read()
-- print("Hello " .. first_name .. "!")
-- print("*****************")
-- io.write("What is your age? ")
-- local age = tonumber(io.read())
-- print("Next year you'll be " .. age + 1 .. " years old")
-- print("*****************")
local t_names = {
  "Red XIII",
  "Dominic",
  "Katrina",
  "Oz",
  "Ash"
}
for _, v in ipairs(t_names) do
  print(v)
end
table.sort(t_names)
for _, v in ipairs(t_names) do
  print(v)
end
local t_ages = {
  52,
  30,
  54,
  26,
  12
}
for _, v in ipairs(t_ages) do
  print(v)
end
table.sort(t_ages)
for _, v in ipairs(t_ages) do
  print(v)
end
print(table.concat(t_names, ", "))
table.remove(t_names, 2)
print(table.concat(t_names, " | "))
table.remove(t_names)
print(table.concat(t_names, " | "))
-- os.remove("dom.txt")
-- print(os.getenv("PATH"))
-- io.output("dom.txt")
-- io.write("This is a test file.\n")
-- io.write("Hello from me")
local myfile = io.open("dom.txt", "a")
print(type(myfile))
if myfile == nil then
  print("Error opening file!")
  return
else
  myfile:write("*****************\n")
  myfile:write("This is some more text.\n")
  myfile:close()
end
print(os.time())
-- local start_time = os.time()
-- for i = 0, 100000 do
--   print("a")
-- end
-- local end_time = os.time()

-- print ("Time taken: " .. os.difftime(end_time, start_time) .. " seconds")

local h = require("helper")
h.Generate()
h.Cleanup()