-- lua supports anonymous functions also known as lambda functions
local add = function(a, b)
    return(a + b)
end

add(4, 7)   -- call function

-- multiple return values
function get_coordinates()
    return 20, 40
end

local a, b = get_coordinates()  -- function call
print(a, b)

-- tables are powerful and can be used for more complex data structures
local person = {
    name = "Jonh",
    age = 30,
    isStudent = false
    grades = {80, 88, 93, 20, 55, 89}
}

print(person.name)  -- accessing nested elements
print(person.grades[3])     -- accessing nested elements


-- coroutines: provide a way to write concurrent code, allow you pause and resume the execution of a function
local co = coroutine.create(function ()
    for i = 1, 3 do
        print("count: ", ..i)
        coroutine.yield()
    end
end)

-- running the coroutine
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)


-- modules: organizes code into reusable units
local mymodule = require("mymodule") -- using the module "mymodule.lua"
mymodule.sayHello()


-- metatables: allow you define how tabales behave in operations
--  creating a metatable
local metatable = {
  __add = function(table1, table2)
    local result = {}
    for i = 1, #table1 do
        result[i] = table[i] + table2[i]
    end
    return result
 end

-- creating tables with metatables
local table1 = {1, 2, 3}
local table2 = {4, 5, 6}

setmetatable(table1, metatable)
setmetatable(table2, metatable)

-- using the defined addition operation
local result = table1 + table2
print(result[2])

