-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/init.lua
-- By: @ExtinctAxolotl
-- thx, @shaunsingh

local modules = {
  "core.mappings",
  "core.options",
  "colors",
}

for i = 1, #modules, 1 do
  pcall(require, modules[i])
end
require("core.mappings").misc()
-- vim:foldmethod=marker
