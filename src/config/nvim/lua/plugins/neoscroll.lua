require("neoscroll").setup({
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	easing_function = "sine",
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
})
