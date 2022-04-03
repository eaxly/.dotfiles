-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/init.lua
-- By: @ExtinctAxolotl
-- thx, @shaunsingh
local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

local modules = {
	"core.mappings",
	"core.options",
  "core.autocmd",
}

for i = 1, #modules, 1 do
	pcall(require, modules[i])
end
require("core.mappings").misc()
-- vim:foldmethod=marker
