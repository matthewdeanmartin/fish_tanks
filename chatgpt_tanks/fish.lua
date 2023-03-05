-- Can't stop with control C!!
-- https://stackoverflow.com/questions/32337591/how-catch-ctrl-c-in-lua-when-ctrl-c-is-sent-via-the-command-line
local signal = require("posix.signal")

signal.signal(signal.SIGINT, function(signum)
  io.write("\n")
  -- put code to save some stuff here
  os.exit(128 + signum)
end)

-- Initialize the fish positions
local fish1x, fish1y = 5, 5
local fish2x, fish2y = 10, 10
local fish3x, fish3y = 15, 15

-- Define the function to draw the fish
function drawFish(x, y)
    -- mdm intially forgot to use x, y
    -- Clear the previous fish position
    io.write("\027[2J")
    -- Draw the fish at the new position
    io.write("\027["..y..";"..x.."H")
    io.write("🐟")
    io.flush()
end

-- Move the fish every second
while true do
    fish1x = fish1x + 1
    fish1y = fish1y + 1
    drawFish(fish1x, fish1y)
    fish2x = fish2x - 1
    fish2y = fish2y - 1
    drawFish(fish2x, fish2y)
    fish3x = fish3x + 1
    fish3y = fish3y - 1
    drawFish(fish3x, fish3y)
    os.execute("sleep 1")
    -- forgot to clear screen
    io.write("\033c")
    io.flush()
end
