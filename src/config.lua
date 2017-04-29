application =
{

	content =
	{
		width = 1024,
		height = 768,
		--width = 800,
		--height = 600, 
		scale = "zoomEven",
		fps = 30,
		xAlign = "center",
        yAlign = "center",
		
		
		imageSuffix =
		{
			    ["@2x"] = 2,
		},
		
	},

	--[[
	-- Push notifications
	notification =
	{
		iphone =
		{
			types =
			{
				"badge", "sound", "alert", "newsstand"
			}
		}
	},
	--]]    
}
