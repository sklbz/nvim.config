return {
	lualine_a = { { "mode" } },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = {
		{
			"filetype",
			icon_only = true,
		},
		{
			"filename",
			newfile_status = true,
			fmt = function(str)
				local pattern = "a"

				return str:sub(str:find(pattern), -1)
			end,
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
