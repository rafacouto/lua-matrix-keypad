--[[

- Lua matrix-keypad driver for NodeMCU (ESP8266)
- License: GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
- Author: Rafa Couto <caligari@treboada.net>
- Documentation and examples: https://github.com/rafacouto/lua-matrix-keypad

--]]

dofile("keypad.lua")

-- configuration
local KEYPAD_ROW_PINS = { 1, 2, 3, 4 }
local KEYPAD_COL_PINS = { 0, 5, 6 }
local KEYPAD_LABELS = "123456789*0#"

-- initialization
local myKeypad = require "keypad"
myKeypad.init(KEYPAD_ROW_PINS, KEYPAD_COL_PINS, KEYPAD_LABELS)

-- use a timer to scan keys every 500ms and print them
tmr.alarm(1, 500, tmr.ALARM_SINGLE, function() 
  local key = myKeypad.scan()
  if key then print(key) end
end)

-- wait for keys
function processKey(key)
  if key then
    print(string.format("You have pressed '%s'", key))
    myKeypad.waitForKey(0, processKey, 30, 200)
  else
    print("Timed out!")
  end
end
print("Press keys or wait 30s...")
myKeypad.waitForKey(0, processKey, 30, 200)

-- vim: et ts=2 sw=2 ai
