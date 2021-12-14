-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- By: @ExtinctAxolotl
Mapper = require("utils").mapper()

function _Neovide_toggle_fullscreen()
	vim.cmd([[
        if g:neovide_fullscreen==v:true
            let g:neovide_fullscreen=v:false
        else
            let g:neovide_fullscreen=v:true
        end
    ]])
end
Mapper.map(
	"v",
	"<leader>Cy",
	'"+y',
	{ noremap = true },
	"Clipboard",
	"clipboard_yank_visual",
	"Copy selection to the clipboard (v)"
)
Mapper.map(
	"v",
	"<leader>Cp",
	'"+p',
	{ noremap = true },
	"Clipboard",
	"clipboard_paste_visual",
	"Paste selection from the clipboard (v)"
)
Mapper.map(
	"v",
	"<leader>CP",
	'"+p',
	{ noremap = true },
	"Clipboard",
	"clipboard_big_paste_visual",
	"PASTE selection from the clipboard (v)"
)
Mapper.map(
	"n",
	"<leader>Cy",
	'"+y',
	{ noremap = true },
	"Clipboard",
	"clipboard_yank_normal",
	"Yank selection to the clipboard"
)
Mapper.map(
	"n",
	"<leader>Cp",
	'"+p',
	{ noremap = true },
	"Clipboard",
	"clipboard_paste_normal",
	"Paste selection from the clipboard"
)
Mapper.map(
	"n",
	"<leader>CP",
	'"+P',
	{ noremap = true },
	"Clipboard",
	"clipboard_big_paste_normal",
	"PASTE selection from the clipboard"
)

-- LSP and others
-- ==============
-- Mapper.map("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true }, "Utilities", "save", "Save the current file")
Mapper.map(
	"n",
	"<F11>",
	"<cmd>lua _Neovide_toggle_fullscreen()<cr>",
	{ noremap = true, silent = true },
	"Neovide",
	"neovide_fullscreen_toggle",
	"Toggle neovide fullscreen mode"
)
-- vim:foldmethod=marker
