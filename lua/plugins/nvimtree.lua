return {
	"nvim-tree/nvim-tree.lua",
	requires = "kyazdani42/nvim-web-devicons" ,
    wants = "nvim-web-devicons",
	config = function()
		require('nvim-tree').setup {
		  diagnostics = {
			enable = true,
		  },

		  view = {
			width = 25,
		--    height = 25,
			side = 'left',
		  },

		  renderer = {
			root_folder_label = false,
		  },

		  git = {
			ignore = false,
		  }
		}

		vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

		local function open_nvim_tree(data)
			if vim.fn.isdirectory(data.file) == 0 then
				return
			end
			vim.cmd.enew()
			vim.cmd.bw(data.buf)
			vim.cmd.cd(data.file)
			require("nvim-tree.api").tree.open()
		end
		
		vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})
	end,
}
