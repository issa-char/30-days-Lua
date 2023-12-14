-- closures: functions that can capture and remeber the values of the variables in their lexical scope
-- first closure
function outerFun(x)
    return function(y)
        return x + y
    end
end


local closure = outerFun(5)
print(closure(3))


-- error handling: lua provides pcall(protected call) and assert for error handling
-- error handling with pcall
local success, result = pcall(function()
    error("this is an erro")
end)

-- file I/0: reading and writing files
-- writing to a file
local file = io.open("mytext.txt", "w")
file:write("hello world")
file:close()

-- reading from a file
file = io.open("mytext.txt", "r")
local content = file:read("*a")
print(content)
file:close()


-- string manipulation
-- lua provides a couple of string funcions to manipulate strings
local str = "lua Programming"
print(string.sub(str, 1, 3)) -- substring

-- find and replace
local newStr = string.gsub(str, "Programming", "Scripting")
print(newStr)


