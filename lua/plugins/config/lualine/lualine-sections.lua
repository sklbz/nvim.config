return {
	lualine_a = { { "mode" } },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = {
		{
			"filetype",
			icon_only = true,
			padding = { left = 1, right = 0 },
		},
		{
			"filename",
			newfile_status = true,
			fmt = function(str)
				local pattern = "%["
				local index = str:find(pattern)

				if not index then
					return ""
				end

				return str:sub(index, -1)
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
