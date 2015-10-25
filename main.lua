
local soundfiles = {
	{"data/birds.ogg", 0.5},
	{"data/storm.ogg", 1.0},
	{"data/sea.ogg", 0.25},
}

require"love"
require"love.audio"
require"love.sound"
require"love.timer"
local sleep = love.timer.sleep

require"love.event"
require"love.keyboard"


--[[
require "love.system"
local detectos = love.system.getOS() -- "OS X", "Windows", "Linux", "Android"
]]--

require "love.window"
-- try to detect architecture
local touchscreen = love.window.isTouchScreen and love.window.isTouchScreen( 1 )

if touchscreen then
	require "love.touch"
end

local vmouse = {x0=nil, y0=nil, x=0, y=0} -- virtual mouse managed with the touch screen
function vmouse:startmove(x, y)
	self.x0 = x
	self.y0 = y
end
function vmouse:stopmove(xe, ye)
	if not( self.x0 and self.y0 ) then return end
	local x0, y0 = self.x0, self.y0
	local dx = x0 - xe
	local dy = y0 - ye
	local x, y = self.x+dx, self.y+dy

	if self.move then self:move(dx, dy) end
	self.x0, self.y0 = nil, nil
	self.x, self.y = x, y
end

function vmouse:move(dx, dy)
	print("dx", dx, "dy", dy)
	local need = 10
	if dx * dx > need*need or dy * dy > need*need then
		love.event.quit()
	end
end

function love.mousepressed( x, y, button, istouch )
	vmouse:startmove(x, y)
end

function love.mousereleased( x, y, button, istouch )
	--if not (vmouse.x0 and vmouse.y0) then return end
	vmouse:stopmove(x, y)
end




-- common code --

local sounds = {}
function love.load()
	for _i, item in ipairs(soundfiles) do
		local filename, vol = item[1], item[2]
		local source = love.audio.newSource(filename, "stream")
		source:setVolume( vol )
		sounds[#sounds+1] = source
	end
	for _i, source in ipairs(sounds) do
		source:setLooping( true )
		source:play()
	end
end

function love.update(_dt)
	sleep(0.5)
end

function love.keypressed(key, _isrepeat)
	if key == "escape" then -- ok for pc keyboard and smartphone hardware key
		love.event.quit()
	end
	
end


--[[
function love.touchpressed( id, x, y, pressure )
	-- multi touch not supported for now
	if love.touch.getTouchCount() > 1 then
		--doMultiTouchStuff()
		return
	end

	-- one touch signal
	vmouse.x0 = x * love.graphics.getWidth()
	vmouse.y0 = y * love.graphics.getHeight()
end
function love.touchreleased(id, x, y, pressure)
	-- multi touch not supported for now
	if love.touch.getTouchCount() > 1 then
		--doMultiTouchStuff()
		return
	end

	if not (vmouse.x0 and vmouse.y0) then return end

	-- Converting the touchscreen's proximity coordinates
	-- to actual pixel coordinates
	local dx = vmouse.x0 - x * love.graphics.getWidth()
	local dy = vmouse.y0 - y * love.graphics.getHeight()
	vmouse.x = vmouse.x + dx
	vmouse.y = vmouse.y = dy
	vmouse.x0 = nil
	vmouse.y0 = nil
end
]]--



