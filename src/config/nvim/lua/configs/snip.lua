local present, ls= pcall(require, "luasnip")
if not present then
  print("could not load luasnip")
  return
end
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

ls.config.set_config({
  history = true,
  enable_autosnippets = false,
  updateevents = "TextChanged,TextChangedI",
})

ls.add_snippets("all", {
  s("lf", {
    t("local "),
    i(1, "name"),
    t(" = function("),
    i(2, "args"), t(")"),
    t({"", "  " }),
    i(3, "content"),
    t({ "","end" })
  }),
  s("trigger", {
    t({"After expanding, the cursor is here ->"}), i(1),
    t({"After jumping forward once, cursor is here ->"}), i(2),
    t({"After jumping once more, the snippet is exited there ->"}), i(0),
  }),
    s("paren_change", {
        c(1, {
          sn(nil, { t("("), r(1, "user_text"), t(")") }),
          sn(nil, { t("["), r(1, "user_text"), t("]") }),
          sn(nil, { t("{"), r(1, "user_text"), t("}") }),
        }),
      }, {
        stored = {
          user_text = i(1, "default_text")
        }
      })
})
require("luasnip.loaders.from_vscode").load()
