-- function to compute the factorial of a number
function factorial(n)
    if (n == 0) then
        return 1
    elseif (n < 0) then
        print("enter a non-zero value")
    else
        return (n * factorial(n - 1))
    end
end

-- get user input (non-negative value)
local c = io.read("*n")
while (c) do
    if (c < 0) then
        print("provide a non-negative")
        break
    elseif (c > 0) then
        print(factorial(c))
        break
    end
end