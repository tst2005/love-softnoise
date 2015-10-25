function love.conf(t)
	t.title = "softnoise"	-- The title of the window the game is in (string)
	t.author = "TsT"		-- The author of the game (string)
	t.identity = "softnoise"	-- The name of the save directory (string)
	t.version = "0.9.1"		-- The LÖVE version this game was made for (number)
	t.console = false		-- Attach a console (boolean, Windows only)

	t.screen = t.screen or {}
--	t.screen.width = 800		-- The window width (number)
--	t.screen.height = 600		-- The window height (number)
	t.screen.fullscreen = false -- Enable fullscreen (boolean)
	t.screen.vsync = false      -- Enable vertical sync (boolean)
	t.screen.fsaa = 0           -- The number of FSAA-buffers (number)

	t.modules = t.modules or {}
	t.modules.joystick = false	-- Enable the joystick module (boolean)
	t.modules.audio = true		-- Enable the audio module (boolean)
	t.modules.keyboard = true	-- Enable the keyboard module (boolean)
	t.modules.event = true		-- Enable the event module (boolean)
	t.modules.image = false		-- Enable the image module (boolean)
	t.modules.graphics = false	-- Enable the graphics module (boolean)
	t.modules.timer = true		-- Enable the timer module (boolean)
	t.modules.mouse = false		-- Enable the mouse module (boolean)
--	t.modules.sound = false		-- Enable the sound module (boolean)
	t.modules.physics = false	-- Enable the physics module (boolean)
end
