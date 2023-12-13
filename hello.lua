-- lua is a dynamically typed language, most often used as a scripting lang for customazation
-- this is how a single line comment is written
--[[
this is a multi line comment in lua
Lua is written in C
]]

-- Variables in  Lua: lua is dynamically type, variables don't have a type
local name = "John"
local score = 444

-- data types: strings, numbers, boolean, table
local result = 450
local bio = "investor, coder, trader and fitness"
local sick = false
local my_table = {2, 3, 5, 8}

-- conditional statements in lua(if, else if, else)
local num = 5

if num > 8 then
    print("greater than 8")
elseif num < 8 then
    print("less than 8")
else
    print("invalid number")
end


-- loops (while, for)
local i = 5

while i <=5 do
    print(i)
    i = i +1
end

local h = 8

for r = 8, 10 do
    print(r)
end

-- functions
function my_fun(name, num)
    print("your name is", name)
    print("you are ", num)
end

-- tables (are versatile: can be used as arrays, dict, or both)
local my_table = {44, 88, 99, 998, 98}
print(my_table[3])
local s_table = {r="name", value = 44}

