local present1, luasnip = pcall(require, "luasnip")
local present2, cmp = pcall(require, "cmp")
local present3, lspkind = pcall(require, "lspkind")

if not present1 then
  print("couldn't load luasnip")
  return
end
if not present2 then
  print("couldn't load cmp")
  return
end
if not present3 then
  print("couldn't load lspkind")
  return
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- sorry TJ :'(
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = "path" },
    { name = "nvim_lsp" },
    { name = 'nvim_lua' },
    { name = "luasnip" }, -- For luasnip users.
    { name = "calc" },

    { name = "buffer", keyword_length = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        path = "[PTH]",
        luasnip = "[SNP]",
        neorg = "[NRG]",
        nvim_lua = "[LUA]"
      },
    }),
  },
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = { "custom", selection_order = "near_cursor" },
  },
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "norg"},
  command = "lua require'cmp'.setup.buffer { sources = { { name = 'neorg' }, { name = 'calc' }, { name = 'path' } } }"
})
