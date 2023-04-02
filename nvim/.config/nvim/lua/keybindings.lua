vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- Multiplexing opt parameters
local opt = { noremap = true, silent = true }

-- Cancel s default function
map("n", "s", "", opt)
-- Windows split screen shortcuts
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- Close current
map("n", "sc", "<C-w>c", opt)
-- Close other
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl jump between windows
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- Left and right proportional control
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- Up and down ratio
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- Ratio
map("n", "s=", "<C-w>=", opt)
--executable script
map("n", "<leader>777", ":!chmod +x %<CR>", opt)

-- Terminal related
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<ESC>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Indent code in visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- Move selected text up and down
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Scroll up and down
map("n", "<A-j>", "4j", opt)
map("n", "<A-k>", "4k", opt)
-- Ctrl u / ctrl + d move only 9 lines, half screen by default
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- Paste without copying in visual mode
map("v", "p", '"_dP', opt)

-- Exit
--map("n", "q", ":q<CR>", opt)
--map("n", "qq", ":q!<CR>", opt)
--map("n", "Q", ":qa!<CR>", opt)

-- In insert mode, jump to the beginning of the line and the end of the line
map("n", "<A-h>", "0", opt)
map("n", "<A-l>", "$", opt)

-- ctrl+s save
map("n", "S", ":w<CR>", opt)
map("n", "Ss", "<ESC>:wq<CR>", opt)

-- Configure Copy Shortcuts
map("v", "<C-c>", '"+y', opt) -- 复制
map("v", "<C-x>", '"+d', opt) -- 剪切

--------------------------------
--ESC
map("i", "<C-[>", "<ESC>", opt)

--------------------------------

-- bufferline keybind
-- Left and right tab switching
map("n", "<leader>=", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>-", ":BufferLineCycleNext<CR>", opt)
-- Close
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bj", ":BufferLineMoveNext<CR>", opt)
map("n", "<leader>bk", ":BufferLineMovePrev<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- find files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- Global search
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("n", "<leader>of", ":Telescope oldfiles<CR>", opt)

-- symbols-outline
map("n", "ol", ":SymbolsOutline<CR>", opt)

-- Floating terminal floaterm
map("n", "<leader>ft", ":FloatermNew<CR>", opt)
map("n", "<leader>fj", ":FloatermPrev<CR>", opt)
map("n", "<leader>fk", ":FloatermNext<CR>", opt)
map("n", "<leader>fs", ":FloatermToggle<CR>", opt)
map("n", "<leader>fc", ":FloatermKill<CR>", opt)
map("n", "<leader>fd", ":FloatermNew lazydocker <CR>", opt)
map("n", "<leader>fg", ":FloatermNew lazygit <CR>", opt)

-- translator
map("n", "tl", ":TranslateW<CR>", opt)
map("v", "tl", ":TranslateW<CR>", opt)

-- auto-save
map("n", "<leader>n", ":ASToggle<CR>", opt)

-- todo-comments keybinding
-- vim.keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next()
-- end, { desc = "Next todo comment" })
--
-- vim.keymap.set("n", "[t", function()
-- 	require("todo-comments").jump_prev()
-- end, { desc = "Previous todo comment" })

-- trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opt)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opt)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opt)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opt)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opt)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opt)

-- asynctask
map("n", "<A-b>", ":AsyncTask file-build<cr>", opt)
map("n", "<A-r>", ":AsyncTask file-run<cr>", opt)

--------------------------------
--leap keymap
-- leap config
require("leap").add_default_mappings()
-- Disable auto jump first match
require("leap").opts.safe_labels = {}
require("leap").opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({ "x", "o", "n" }, "<leader>l", "<Plug>(leap-forward-to)")
vim.keymap.set({ "x", "o", "n" }, "<leader>h", "<Plug>(leap-backward-to)")
---- flit config
require("flit").setup({
	keys = { f = "ff", F = "FF", t = "tt", T = "TT" },
	-- A string like "nv", "nvo", "o", etc.
	labeled_modes = "v",
	multiline = true,
	opts = {},
})
--------------------------------

-- Plugin Shortcuts
local pluginKeys = {}

-- nvim-tree
-- alt + m key to open and close tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
--fetch
map("n", "\\", ":FencAutoDetect<CR>", opt)

-- List shortcuts
pluginKeys.nvimTreeList = {
	-- Open a file or folder
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- Split screen to open files
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- show hidden files
	{ key = "i", action = "toggle_custom" }, -- Corresponds to custom (node_modules) in filters
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- file operations
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- Insert mode shortcuts in the Telescope list
pluginKeys.telescopeList = {
	i = {
		-- Moving up and down
		["<C-n>"] = "move_selection_next",
		["<C-p>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- history record
		["<C-j>"] = "cycle_history_next",
		["<C-k>"] = "cycle_history_prev",
		-- close the window
		["<C-c>"] = "close",
		-- The preview window scrolls up and down
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

pluginKeys.mapLSP = function(mapbuf)
	-- rename
	-- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	-- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)

	-- 不支持 mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	-- diagnostic
	-- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	-- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
	-- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- 没用到
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp autocompletion
pluginKeys.cmp = function(cmp)
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	return {
		-- Completion appears
		["<A-,>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- Cancel
		["<A-.>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Prev
		["<C-p>"] = cmp.mapping.select_prev_item(),
		-- Next
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- confirm
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
			--behavior = cmp.SelectBehavior.Replace,
		}),
		-- Scrolling if the window has too much content
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- Custom code snippet to jump to next parameter
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-jump-next)", "")
			end
		end, { "i", "s" }),

		-- Custom code snippet to jump to the previous parameter
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
				--elseif vim.fn["vsnip#available"](1) == 1 then
				--feedkey("<Plug>(vsnip-jump-next)", "")
			elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
				--elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				--feedkey("<Plug>(vsnip-jump-prev)", "")
			elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

-- nvim-dap
pluginKeys.mapDAP = function()
	-- Begin
	map("n", "<leader>dd", ":lua require('dap').continue()<CR>", opt)
	-- Stop
	map(
		"n",
		"<leader>de",
		":lua require'dap'.close()<CR>"
			.. ":lua require'dap'.terminate()<CR>"
			.. ":lua require'dap.repl'.close()<CR>"
			.. ":lua require'dapui'.close()<CR>"
			.. ":lua require('dap').clear_breakpoints()<CR>"
			.. "<C-w>o<CR>",
		opt
	)
	-- Continue
	map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
	-- Set BreakPoint
	map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
	map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
	--  stepOver, stepOut, stepInto
	map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
	map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
	map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
	-- Pop-ups
	map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

pluginKeys.gitsigns = function(bufnr)
	local gs = package.loaded.gitsigns

	local function gitsignsMap(mode, l, r, opts)
		opts = opts or { noremap = true, silent = true }
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	gitsignsMap("n", "<leader>j", ":Gitsigns next_hunk<CR>")
	gitsignsMap("n", "<leader>k", ":Gitsigns prev_hunk<CR>")
	-- Actions

	gitsignsMap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
	gitsignsMap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
	gitsignsMap("n", "<leader>hS", gs.stage_buffer)
	gitsignsMap("n", "<leader>hu", gs.undo_stage_hunk)
	gitsignsMap("n", "<leader>hR", gs.reset_buffer)
	gitsignsMap("n", "<leader>hp", gs.preview_hunk)
	gitsignsMap("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end)
	gitsignsMap("n", "<leader>tb", gs.toggle_current_line_blame)
	gitsignsMap("n", "<leader>hd", gs.diffthis)
	gitsignsMap("n", "<leader>hD", function()
		gs.diffthis("~")
	end)
	gitsignsMap("n", "<leader>td", gs.toggle_deleted)

	-- Text object
	gitsignsMap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
