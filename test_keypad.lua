--[[

- Lua matrix-keypad driver for NodeMCU (ESP8266)
- License: GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
- Author: Rafa Couto <caligari@treboada.net>
- Documentation and examples: https://github.com/rafacouto/lua-matrix-keypad

--]]

dofile("keypad.lua")

-- configuration
local ROW_PINS = { 8, 7, 6, 5 }
local COL_PINS = { 4, 3, 2 }
local LABELS = "123456789*0#"

-- initialization
local myKeypad = require "keypad"
myKeypad.init(ROW_PINS, COL_PINS, "123456789*0#")

-- use a timer to scan keys every 100ms and print them
tmr.alarm(0, 100, tmr.ALARM_AUTO, function() 
  local key = myKeypad.scan()
  if key then print(key) end
end)

-- vim: et ts=2 sw=2 ai
