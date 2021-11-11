-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local nvimtree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

function NvimTreeTrash()
	local lib = require("nvim-tree.lib")
	local node = lib.get_node_at_cursor()
	local trash_cmd = "trash "

	local function get_user_input_char()
		local c = vim.fn.getchar()
		return vim.fn.nr2char(c)
	end

	print(" Trash " .. node.name .. " ? [y/n]")

	if get_user_input_char():match("^y") and node then
		vim.fn.jobstart(trash_cmd .. node.absolute_path, {
			detach = true,
			on_exit = function(job_id, data, event)
				lib.refresh_tree()
			end,
		})
	end

	vim.api.nvim_command("normal :esc<CR>")
end

vim.g.nvim_tree_respect_buf_cwd = true
vim.g.nvim_tree_window_picker_exclude = {
	filetype = {
		"notify",
		"packer",
		"qf",
	},
	buftype = { "terminal" },
}

nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "right",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {
				{ key = "d", cb = ":lua NvimTreeTrash()<CR>" },
			},
		},
	},
})
