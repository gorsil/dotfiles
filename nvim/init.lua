require("lazy_nvim")

-- lazy.vim not happy about this for some reason
-- but I'm pretty sure it overrides them for some fking reason
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.cmd("colorscheme tokyonight")

-- Indentation settings
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Window switching
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })

-- ====================================
-- PLUGIN CONFIGURATIONS
-- ====================================

-- LSP and completion setup
local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

-- LSP servers setup
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").pylsp.setup({ capabilities = capabilities })
require("lspconfig").gopls.setup({ capabilities = capabilities })
require("lspconfig").gdscript.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({ capabilities = capabilities })

-- NvimTree setup
local function nvim_tree_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Unbind S (external editor) and map C-s for vertical split
	vim.keymap.del("n", "s", { buffer = bufnr })
	vim.keymap.del("n", "S", { buffer = bufnr })
	vim.keymap.set("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))

	-- Rebind C-o to open file normally (same as 'o')
	vim.keymap.set("n", "<C-o>", api.node.open.edit, opts("Open"))
end

require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	on_attach = nvim_tree_on_attach,
})

-- NvimTree keybinding
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Treesitter setup
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"gdscript",
		"go",
		"javascript",
		"lua",
		"python",
		"typescript",
		"zig",
		"json",
		"markdown",
		"markdown_inline",
		"toml",
		"yaml",
	},
	auto_install = true,
	highlight = { enable = true },
	incremental_selection = { enable = true },
})

-- EasyMotion configuration
vim.g.EasyMotion_startofline = 0
vim.g.EasyMotion_smartcase = 1

-- EasyMotion keybindings
vim.keymap.set({ "n", "o" }, "/", "<Plug>(easymotion-sn)", { noremap = false })
vim.keymap.set("o", "/", "<Plug>(easymotion-tn)", { noremap = false })
vim.keymap.set({ "n", "o" }, "n", "<Plug>(easymotion-next)", { noremap = false })
vim.keymap.set({ "n", "o" }, "N", "<Plug>(easymotion-prev)", { noremap = false })
vim.keymap.set({ "n", "o" }, "<Leader>l", "<Plug>(easymotion-lineforward)", { noremap = false })
vim.keymap.set({ "n", "o" }, "<Leader>j", "<Plug>(easymotion-j)", { noremap = false })
vim.keymap.set({ "n", "o" }, "<Leader>k", "<Plug>(easymotion-k)", { noremap = false })
vim.keymap.set({ "n", "o" }, "<Leader>h", "<Plug>(easymotion-linebackward)", { noremap = false })
vim.keymap.set("n", "s", "<Plug>(easymotion-s2)", { noremap = false })
vim.keymap.set("n", "t", "<Plug>(easymotion-t2)", { noremap = false })
vim.keymap.set({ "n", "o" }, "<Leader>w", "<Plug>(easymotion-bd-w)", { noremap = false })
vim.keymap.set("n", "<Leader>w", "<Plug>(easymotion-overwin-w)", { noremap = false })

-- Lualine setup
require("lualine").setup({
	options = {
		theme = "tokyonight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree" },
})

-- Telescope setup
require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("fzf")

-- Telescope keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>/", builtin.live_grep, { desc = "Search stuff" })
vim.keymap.set("n", "<space>.", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = "Search word under cursor" })
vim.keymap.set("n", "<space>f", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<space>b", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<space>h", builtin.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<space>r", builtin.oldfiles, { desc = "Search recent files" })

-- Conform.nvim configuration (formatters)
require("conform").setup({
	formatters_by_ft = {
		python = { "ruff_format", "ruff_organize_imports" },
		go = { "gofmt", "goimports" },
		lua = { "stylua" },
		yaml = { "yamlfix" },
		["*"] = { "trim_whitespace", "trim_newlines" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- LSP diagnostic configuration and keybindings
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Show virtual text only on current line with delay
local current_line_ns = vim.api.nvim_create_namespace("current_line_diagnostics")
local diagnostic_timer = nil

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	callback = function()
		-- Clear previous virtual text immediately
		vim.api.nvim_buf_clear_namespace(0, current_line_ns, 0, -1)

		-- Cancel previous timer
		if diagnostic_timer then
			diagnostic_timer:stop()
			diagnostic_timer:close()
		end

		-- Set new timer with delay
		diagnostic_timer = vim.loop.new_timer()
		diagnostic_timer:start(
			500,
			0,
			vim.schedule_wrap(function()
				-- Get diagnostics for current line only
				local line = vim.api.nvim_win_get_cursor(0)[1] - 1
				local diagnostics = vim.diagnostic.get(0, { lnum = line })

				if #diagnostics > 0 then
					-- Show virtual text for current line only
					local text = {}
					for _, diagnostic in ipairs(diagnostics) do
						table.insert(text, {
							" " .. diagnostic.message,
							"DiagnosticVirtualText" .. vim.diagnostic.severity[diagnostic.severity],
						})
					end
					vim.api.nvim_buf_set_extmark(0, current_line_ns, line, -1, {
						virt_text = text,
						virt_text_pos = "eol",
					})
				end
			end)
		)
	end,
})

-- LSP diagnostic keybindings
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- GitSigns setup
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		-- Navigation
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr, desc = "Next git change" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, buffer = bufnr, desc = "Previous git change" })

		-- Actions
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview git change" })
		vim.keymap.set("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { buffer = bufnr, desc = "Git blame line" })
	end,
})
