-- Lua syntax highlighting test for Islands Dark theme

-- Comments should be gray (#7A7E85)

--[[
  Multi-line comments should also be gray
  Documentation comments should be muted green (#5F826B)
]]

-- Module definition
local M = {}

-- Constants should be purple (#C77DBB)
local VERSION = "1.0.0"
local MAX_RETRIES = 3
local DEFAULT_TIMEOUT = 5000

-- Numbers should be cyan (#2AACB8)
local pi = 3.14159
local count = 42
local hex = 0xFF
local exp = 1.5e-3

-- Strings should be green (#6AAB73)
local single_quote = 'Hello, World!'
local double_quote = "Lua is awesome"
local multiline = [[
  This is a
  multi-line string
]]

-- Booleans should be orange (#CF8E6D) - keywords
local is_enabled = true
local is_disabled = false
local nothing = nil

-- Tables (Lua's primary data structure)
local config = {
  host = "localhost",      -- Strings green
  port = 8080,             -- Numbers cyan
  timeout = 30,
  enabled = true,
  tags = { "api", "web", "service" },
  nested = {
    key = "value",
    count = 10,
  },
}

-- Function definition - function name should be blue (#56A8F5)
function M.greet(name)
  -- Keywords should be orange (#CF8E6D)
  if name == nil then
    name = "World"
  end
  
  -- String concatenation
  local message = "Hello, " .. name .. "!"
  print(message)
  
  return message
end

-- Local function
local function calculate_sum(a, b)
  return a + b
end

-- Function with multiple returns
local function divide(a, b)
  if b == 0 then
    return nil, "division by zero"
  end
  return a / b, nil
end

-- Table as object with methods
local User = {}
User.__index = User

-- Constructor pattern
function User.new(name, email)
  local self = setmetatable({}, User)
  self.name = name
  self.email = email
  self.created_at = os.time()
  return self
end

-- Method definition
function User:get_name()
  return self.name
end

function User:set_name(name)
  self.name = name
end

function User:to_string()
  return string.format("User(%s, %s)", self.name, self.email)
end

-- Control structures
function M.process_items(items)
  -- For loop with ipairs
  for i, item in ipairs(items) do
    print(string.format("Item %d: %s", i, item))
  end
  
  -- For loop with pairs
  for key, value in pairs(items) do
    print(string.format("%s = %s", key, value))
  end
  
  -- Numeric for loop
  for i = 1, 10 do
    print(i)
  end
  
  -- For loop with step
  for i = 10, 1, -1 do
    print(i)
  end
  
  -- While loop
  local count = 0
  while count < 5 do
    print(count)
    count = count + 1
  end
  
  -- Repeat-until loop
  local x = 0
  repeat
    x = x + 1
    print(x)
  until x >= 5
end

-- Conditional statements
function M.check_status(status)
  if status == "active" then
    return "User is active"
  elseif status == "inactive" then
    return "User is inactive"
  elseif status == "pending" then
    return "User is pending"
  else
    return "Unknown status"
  end
end

-- Operators
function M.demonstrate_operators()
  -- Arithmetic operators should be default color
  local a = 10 + 5
  local b = 20 - 10
  local c = 4 * 5
  local d = 20 / 4
  local e = 10 % 3
  local f = 2 ^ 3  -- Power
  
  -- Comparison operators
  local is_equal = (a == b)
  local not_equal = (a ~= b)
  local greater = (a > b)
  local less = (a < b)
  local gte = (a >= b)
  local lte = (a <= b)
  
  -- Logical operators (keywords)
  local result1 = true and false
  local result2 = true or false
  local result3 = not true
  
  -- String concatenation
  local name = "John" .. " " .. "Doe"
  
  -- Length operator
  local len = #name
  
  return { a, b, c, d, e, f }
end

-- Error handling with pcall
function M.safe_call(func, ...)
  local success, result = pcall(func, ...)
  
  if success then
    return result
  else
    print("Error: " .. tostring(result))
    return nil
  end
end

-- Variadic function
function M.sum(...)
  local args = {...}
  local total = 0
  
  for _, value in ipairs(args) do
    total = total + value
  end
  
  return total
end

-- Closures and upvalues
function M.create_counter()
  local count = 0
  
  return function()
    count = count + 1
    return count
  end
end

-- Metatables and metamethods
function M.create_vector(x, y)
  local vector = { x = x, y = y }
  
  local mt = {
    __add = function(v1, v2)
      return M.create_vector(v1.x + v2.x, v1.y + v2.y)
    end,
    
    __sub = function(v1, v2)
      return M.create_vector(v1.x - v2.x, v1.y - v2.y)
    end,
    
    __tostring = function(v)
      return string.format("Vector(%d, %d)", v.x, v.y)
    end,
    
    __index = {
      length = function(self)
        return math.sqrt(self.x^2 + self.y^2)
      end
    }
  }
  
  return setmetatable(vector, mt)
end

-- Pattern matching with string library
function M.parse_email(email)
  -- Regex pattern should be highlighted
  local pattern = "^[%w%._%+-]+@[%w%._%+-]+%.%a+$"
  
  if string.match(email, pattern) then
    return true
  else
    return false
  end
end

-- Table manipulation
function M.table_operations()
  local t = { 1, 2, 3, 4, 5 }
  
  -- Table library functions should be blue
  table.insert(t, 6)
  table.remove(t, 1)
  table.sort(t)
  
  local joined = table.concat(t, ", ")
  
  return t
end

-- String operations
function M.string_operations(str)
  local upper = string.upper(str)
  local lower = string.lower(str)
  local len = string.len(str)
  local sub = string.sub(str, 1, 5)
  local find = string.find(str, "pattern")
  local gsub = string.gsub(str, "old", "new")
  
  return {
    upper = upper,
    lower = lower,
    length = len,
    substring = sub,
  }
end

-- Coroutines
function M.coroutine_example()
  local co = coroutine.create(function()
    for i = 1, 5 do
      print("Coroutine: " .. i)
      coroutine.yield()
    end
  end)
  
  -- Resume coroutine
  while coroutine.status(co) ~= "dead" do
    coroutine.resume(co)
  end
end

-- Module pattern with require
function M.init()
  -- Built-in modules
  local json = require("cjson")  -- If available
  local math = require("math")
  local os = require("os")
  local io = require("io")
  
  print("Module initialized at: " .. os.date())
end

-- Global built-in functions should be blue
function M.use_builtins()
  local t = type("hello")
  local str = tostring(123)
  local num = tonumber("456")
  
  print("Type:", t)
  assert(num == 456, "Conversion failed")
  error("This is an error")
end

-- Export module
return M
