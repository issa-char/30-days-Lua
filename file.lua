local a = "tom"
local c = "jerry"
local d = "john"

io.write("THIS IS I/O simmpler operation")

io.write("the sin of 33 = ", math.sin(33), "\n")
io.write(string.format("the sin of 3 = %.3f\n", math.sin(3)))

local r = io.read("n")  -- read a number
local s = io.read("l")  -- read a line
-- local q = io.read(num)  -- read num character as string
io.write(r)

-- THE COMPLETE I/O model
local f = io.open("mytext.txt", "r")    -- open file for reading
local f = assert(io.open("mytext.txt", "r"))    -- assert catches errors if unable to open file/nil
