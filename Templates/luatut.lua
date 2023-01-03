print("Hello World")
--start randomize
math.randomseed(os.time())
-- long string
name = 'Derek'
longString = [[
I am a
some string
a
]]..name
-- precision formatting
mypistring = string.format("Pi = %.10f", math.pi)
io.write("Size of string ", longString , math.random(10), " ", mypistring ,"\n")

age = 13
--if else statement ~ means not
if age ~= 14 or age ~= 10 then
    io.write("not 14","\n")

elseif age == 15 then
    io.write("bobobo","\n")
else
    io.write("kkkkkk","\n")
end
--to string
io.write(string.format("not true = %s", tostring(not true)), "\n")
-- ternary operator
canVote = age > 18 and true or false
-- get length of string
io.write("length: ", #longString, "\n")
-- string manipulation, replace
io.write("replace: ", string.gsub(longString, "I", "We"), "\n")
-- string manipulation, getting string index
io.write("index of some", string.find(longString, "some"), "\n")
-- string manipulation,  upper and lower cases
io.write("index of some", string.upper(longString), "\n")
io.write("index of some", string.lower(longString), "\n")
-- repeat like while loop
repeat
    io.write("Enter your guess : ")

    guess = io.read()

until tonumber(guess) == 15
-- for loop
for i = 1, 10, 1 do
    io.write(i, "\n")
end
-- loop through a table
months = {"Jan", "Feb", "March"}

for key, value in pairs(months) do
    io.write(key, " ", value, "\n")
end
-- adding and removing values to table
aTable = {}
for i = 1, 10 do
    aTable[i] = i
end
io.write("First value: ", aTable[1], " the sie of table is: ", #aTable , "\n")
table.insert(aTable, 1, 0)
io.write("First value: ", aTable[1], " the sie of table is: ", #aTable , "\n")
table.remove(aTable, 1)
table.remove(aTable, 2)
--convert table to string
print(table.concat(aTable, ", "))
-- table matrix
aMultiTable = {}
for i = 0, 9 do
    aMultiTable[i] = {}
    for j = 0, 9 do
        aMultiTable[i][j] = tostring(i) .. tostring(j)
    end
end
io.write("Table[3,4]: ", aMultiTable[3][4], "\n")
-- function example
function getSum(num1, num2)
    return num2+num1
end
print(string.format("%d", getSum(5,2)))
--function example string manipulation
function splitStr(theString)
    stringTable = {}
    local i = 1
    for word in string.gmatch(theString, "[^%s]+") do
        stringTable[i] = word
        i = i + 1
    end
    return stringTable, i
end
splitStrTable, numOfStr = splitStr("The Turtle")
print(numOfStr)
for j = 1, numOfStr - 1 do
    print(string.format("%d : %s", j, splitStrTable[j]))
end
-- irratic function
function getSumMore(...)
    local sum = 0
    for k, v in pairs{...} do
        sum = sum + v
    end
    return sum
end
print(string.format("%d", getSumMore(1,2,3,4)))
-- another function example
doubleIt = function(x) return x*2 end
print(doubleIt(2))
-- enclosure of inner function
function outerFunc()
    local i = 0

    return function()
        i = i + 1
        return i
    end
end
getI = outerFunc()
print(getI())
print(getI())
--corutine example
print("Starting coroutine...")
co = coroutine.create(function()
    for k = 2, 10, 2 do 
        print("number:", k)
        print("running status: ", coroutine.status(co))
        if k == 6 then coroutine.yield() end
    end
end)
print("first stat: ", coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
co2 = coroutine.create(function()
    for i = 101, 110, 1 do
        print(i)
    end 
end)
coroutine.resume(co2)
print("intermediate")
coroutine.resume(co)
-- file manipulation
-- r: read only (default)
-- w: Overwrite or create a new file
-- a: append or create a new file
-- r+: read & write existing file
-- w+: Overwrite read or create a file
-- a+: Append read or create file
file = io.open("test.lua", "w+")
file:write("random string of text \n")
file:write(" more random string of text \n")

file:seek("set", 0)
print(file:read("*a"))
file:close()

file = io.open("test.lua", "a+")
file:write("EVEN MOIRE TEXT\n")
file:seek("set",0)
print(file:read("*a"))
file:close()
-- metatables and metamethods
atable = {}
for x = 1, 10 do
    atable[x] = x
end

mt = {
    __add = function(table1, table2)
    sumTable = {}

    for y = 1, #table1 do
        print(table1[y])
        if (table1[y] ~= nil) and (table2[y] ~= nil) then
            sumTable[y] = table1[y] + table2[y]
        else
            sumTable[y] = 0
        end
    end
    return sumTable
end,
}

setmetatable(atable, mt)

print(atable == atable)

addTable = {}

addTable = atable + atable
for z = 1, #addTable do
    print(addTable[z])
end
-- OOP in lua
Animal = {h = 0,w = 0, name = "some name"}

function Animal:new (h, w, name)
    setmetatable({}, Animal)
    self.h = h
    self.w = w
    self.name = name


    return self
end

function Animal:toString()
    animalStr = string.format("%s weights %.1f kg", self.name, self.h )
    return animalStr
end

spot = Animal:new(10,15,"Cat")

print(spot.w)
print(spot:toString())
