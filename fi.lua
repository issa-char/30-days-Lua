local c = assert(io.open("mytext.txt", r))
local d = c:read("a")
c:close()
io.stdout:write(d)

local a = assert(io.open("mytext.txt", "r"))
local e = io.input()
a:close()
io.read()
