# Things to know about the Lua language (version 5.3)

## chunks
chunks are functions, expressions, statement/s in lua or a file containing lua statements.

## lexical conventions
identifier names can begin with letters and underscores, but not a digit.
refrain from using identifiers names that begin with underscore and then uppercase letters; they are reserved for special uses. e.g  _VERSION
- reserved identifiers:
`and` `end` `if` `or` `until` `break` `do` `else` `elseif` `or` `until` `while` `repeat` `return` `then` `true` `not` `goto` `elseif` `true` `false` `then` `nil` `function` `for` `local` `repeat` `in`

## comments
`-- this is a single line comment in lua`
```lua
--[[
    this is multi-line 
    comment in Lua
]]
```
## global variables
- variables available file wide
- don't need declaration
```Lua
name = "John"
age
-- these are the ways to declare global variables.
-- all uninitilized variables have a nil value
```
## local variables
- variables available within a function; can't be accessed file wide
```Lua
local name
local country = "KE"
-- this is how we declare local variables
```
## types and values
- Lua is dynamically-typed: no need for variable declarations; any variable can contain values of any type
- each value assigned carries its own type
- to get the type of a value/identifier we use the `type()` function
- these are the types in lua:
`boolean` `string` `nil` `numbers` `table` `function` `userdata`

## the lua interpreter
- the interpreter is the program we use to run our lua scripts
- a file that starts with #!/location/of/lua is executed as a script
- the usage: 
```Lua
    lua [options] [script] [args] -- execute script
    lua -e "print (math.sin(34))" -- enter code directly to the cmd line
    lua -i [script] -- enter intertractive mode after running script
    lua -llib -e "print(math.sin(34))"  -- load a library (-l)
```
## Numbers
- numerals can can take an optional decimal part plus an optional exponent
```lua
a = 5
b = 4.5
c = 4.4e2
e = 7E+30
```
- both int and float have the type number. To distinguish between the float and int
we use `math.type()`
- lua supports hexadecimal just prefix with the 0x

## operators
* arithmetic: lua supports all arithmetic operators( +, -, *, //, /)
* relational: <, >, ==, >= <=, ~=

## math library
- lua provides a mathematical library with a set of mathematical functions
- `math.max()` `math.sin()` `math.huge()` `math.floor` `math.random()`
- random number generator `math.random()`
- rounding functions    `math.floor()`, `math.ceil()`, `math.modf()`
- convert to interger `math.tointeger()` returns a nil if impossible

## strings
- represents a text delimited by double/single quotes and are immutable
- for long strings we delimit using [[]]
- to get the length of a string we use `print(#"string")`
- to concatenate strings use .. i.e `a = "hello" .. "world"`
- to convert number to string use `tostring()` and `tonumber()` for its opposite
- lua provides various function to manipulate strings in the string library
`string.gsub()` `string.len()`, `string.rep(s, n)`

## coersions
## tables
- tables are the only data structuring mechanism in Lua
- we use tables to represent arrays, sets, records and many other data structures
- tables are also used to represent packages and objects as well
- a table accepts values of any type except nil
- we create a table by means of a constructor expression`{}`
- we use indeces to get a table value
`a = {}`
```lua
my_table = {}
my_data = {20, 40, "john", a = "Kenny"}
my_table[b] = 30
```
- the table library provides useful functions to operate over lists and sequences
`table.insert`, `table.remove` `table.move`
- table traversal: to iterator values in in table we use `ipairs` `pairs` and `#table` depending on need in a loop.
```lua
t = {"age", "gender", "status"}
for k, v ipairs(t) do
    print(k, v)
end
```

## arrays, lists and sequences
- simply use  a table with the integer keys, just initialize the elements in the table

## functions
- functions are the main mechanism of abstraction of statements and expressions in lua
- functions can carry out specific tasks/procedure/subroutine or compute and return values
- function calls execute the function and can be used in expressions or as a statement
```lua
function my_fun(name, age)
    if age > 18 then
        print("you are an adult")
    else
        print("you are a minor")
    end
    print(name .. "is" .. age)
end
```
- return: in lua a function can return more than one result `return a, b, c`
- variadic function is a function that takes an unkown number of arguments expressed like this ` function my_fun(...)`
- table.unpack: table library function that unpacks a list/table `table.unpack(table)`
# the external world
lua does not offer much usage on the external world due to the emphasis on portability and embeddability. This is left for the main program/host application or through external libraries.
lua offfers only the basic functionalities: basic file manipulation and a little bit extra.
for file manipulation the I/O library offers two models: the simple I/O model and the complete I/O model.

## simple I/O model
- model assumes current input and outstream which its models operate on.
- the lib initializes the current input stream to the process's standard input(stdin) and (stdout) to the standard output.
- io.read() reads a line from the stdin and io.write() writes to the stdout.
- unlike using print(), io.write() allows us to control our output.
- the `io.read()` reads from the input stream and its arguments control what to read: `a`, `l`, `L`, `n`, num
```lua
local a = io.read() -- read from stdin
io.write(a)     -- write to stdout
io.write(string.format("sin(2) = %.3f\n", math.sin(2)))

```
- to change the input and output stream from default we use: `io.input()` and `io.output()`. However not effectiv on handling errors.
```lua
io.input("mytext.txt") -- sets mytext.txt as input stream in read mode, all inputs come from this file
io.output("myfile.txt")  -- sets myfile.txt as output stream
```
## the complete I/0 model
- the complete I/O model is convenient for advanced file manipulation, such as reading from or writing to several files simultaneously as well as handling errors.
- we need to open a file before reading or writing to it and close it after we've completed using it.
- opening a file: `local f = assert(io.open("mytext.txt", mode))` opens a file with the preferred mode `r` `w` `a`, assert is used to catch any error that occurs.
- closing file: `f: close()`
- lua provides `io.stdout`, `io.stderr`, and `io.stdin ` to directly send message
```lua
local t = assert(io.open("mytext.txt", "r"))
local c = t:read("a")
t:close()
io.stdout:write(c)  -- write to the stdout
```
