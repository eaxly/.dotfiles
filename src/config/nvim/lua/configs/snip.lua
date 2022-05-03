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

ls.add_snippets("lua", {
  s("lf", {
    t("local "),
    i(1, "name"),
    t(" = function("),
    i(2, "args"), t(")"),
    t({"", "  " }),
    i(3, "content"),
    t({ "","end" })
  }),
})

ls.add_snippets("NeogitCommitMessage", {
  s("feat", {
    t("feat("),
    i(1, "scope"),
    t("): "),
    i(2, "msg"),
    t({ "", "", "" }),
    i(0, "desc"),
  })
})

ls.add_snippets("gitcommit", {
  s("feat", {
    t("feat("),
    i(1, "scope"),
    t("): "),
    i(2, "msg"),
    t({ "", "", "" }),
    i(0, "desc"),
  })
})
