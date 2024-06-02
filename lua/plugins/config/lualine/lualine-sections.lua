return {
	lualine_a = { { "mode" } },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = {
		{
			"filetype",
			icon_only = true,
		},
		{
			"buffers",
			icons_enabled = false,
		},
	},
	lualine_x = { "fileformat" },
	lualine_y = { "progress" },
	lualine_z = { "location" },
}
