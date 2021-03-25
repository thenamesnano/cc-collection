---- Nano Guard v1.0.0

-- Check Password
function checkPassword()
  term.setCursorPos(1,2)
  textutils.slowPrint("Password:")
  print(">")
  term.setCursorPos(3,3)
  term.setTextColor(colors.gray)
  local input = read("#")
  term.setTextColor(colors.white)
  
  if input == "Lifeline" then
    return true
  else return false
  end
end

-- Correct Password
function correct()
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.yellow)
  term.write(os.getComputerLabel())
  term.setTextColor(colors.orange)
  term.write(" : ")
  term.setTextColor(colors.yellow)
  term.write(os.getComputerID())
  term.setTextColor(colors.orange)
  term.write(" : ")
  term.setTextColor(colors.yellow)
  local fuel = turtle.getFuelLevel()
  term.write(fuel)
  term.setTextColor(colors.white)
  term.setCursorPos(1,2)
end


-- Execution
local backup = os.pullEvent
os.pullEvent = os.pullEventRaw

local w,h = term.getSize()
local loop = true
while loop do
  term.clear()
  term.setCursorPos(1,1)
  term.setBackgroundColor(colors.orange)
  local x = 0
  repeat
    term.write(" ")
    x = x + 1
  until x == w
  term.setTextColor(colors.black)
  term.setCursorPos(2,1)
  term.write("NanoGuard v1.0.0")
  term.setCursorPos(1,1)
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.white)
  local continue = checkPassword()
  if continue == true then
    loop = false
    os.pullEvent = backup
    break
  elseif continue == false then
    term.setCursorPos(3,3)
    local x = 3
    repeat
      term.write(" ")
      x = x + 1
    until x == w
    term.setCursorPos(3,3)
    term.setTextColor(colors.red)
    textutils.slowWrite("Incorrect")
    term.setTextColor(colors.white)
    sleep(2)
  else
    --os.pullEvent = os.pullEventRaw
    --os.pullEventRaw("terminate")
    os.shutdown()
  end
  term.clear()
end

correct()
