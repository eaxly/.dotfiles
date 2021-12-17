-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/init.lua
-- By: @ExtinctAxolotl
-- thx, @shaunsingh

require("impatient")
local modules = {
  "options",
  "pack",
  "mappings",
  "theme",
  "packer_compiled",
}

for i = 1, #modules, 1 do
  pcall(require, modules[i])
end
-- vim:foldmethod=marker
