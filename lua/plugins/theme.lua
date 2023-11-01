return {
	  "ellisonleao/gruvbox.nvim"
	, priority = 1000
	, config = true
	, opts = function()
		-- Default options:
		require("gruvbox").setup({
			italic = {
				strings = false,
			},
			invert_selection = false,
			contrast = "soft", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			transparent_mode = true,
		})
		vim.cmd([[colorscheme gruvbox]])
	end
}
