require("nvim-tree").setup{
	sort = {
		sorter = "case_sensitive",
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		git_ignored = false,
		dotfiles = false,
		git_clean = true,
		no_buffer = false,
		no_bookmark = false,
		custom = {},
		exclude = {},
	}
}
local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>q", api.tree.toggle, {})
