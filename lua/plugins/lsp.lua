-- Nicer filetree than NetRW
return {
	{
		"neoclide/coc.nvim",
		branch = "master",
		build = "npm ci",
		lazy = false,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
			"sheerun/vim-polyglot",
			"windwp/nvim-autopairs",
		},
		
		config = function()
			--[[ COC Config ]]--
			local conf = vim.o
			local keymap = vim.api.nvim_set_keymap
			local expr_opts = { noremap = true, silent = true, expr = true }
			local opts = { noremap = true, silent = true }

			-- keymap
			keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
			keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
			keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
			keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})

			keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
			keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})

			-- use <c-space> to trigger completion.
			keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

			--keymap("i", "<TAB>", "coc#pum#visible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
			--keymap("i", "<S-TAB>", "coc#pum#visible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})

			keymap(
				"i",
				"<CR>",
				[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
				expr_opts
			)

			vim.api.nvim_exec([[
				function! s:check_back_space() abort
				  let col = col('.') - 1
				  return !col || getline('.')[col - 1] =~ '\s'
				endfunction

				inoremap <silent><expr> <TAB>
					\ coc#pum#visible() ? coc#pum#next(1):
					\ <SID>check_back_space() ? "\<Tab>" :
					\ coc#refresh()

			]], false)

			-- AutoCmds
			-- highlight the symbol and its references when holding the cursor.
			vim.api.nvim_create_autocmd("CursorHold", { pattern = '*', command = [[call CocActionAsync("highlight")]] })

			--keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

			conf.hidden = true
			conf.backup = false
			conf.writebackup = false
			conf.updatetime = 300

		end,
	},
}
