return {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff",
		{
			"diagnostics",
			symbols = { error = ' ', warn = ' ', info = ' ' },
		}
	},
	lualine_c = {
		{
			"filetype",
			icon_only = true,
			padding = { left = 1, right = 0 },
		},
		{
			"buffers",
			icons_enabled = false,
		},
	},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {}
	-- lualine_x = { "fileformat" },
	-- lualine_y = { "progress" },
	-- lualine_z = { "location" },
}
