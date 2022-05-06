local present, neorg = pcall(require, "neorg")
if not present then
  print("neorg could not load")
  return
end
neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {
      config = {
        icons = {
          todo = {
            done = {
              icon = "✔",
            },
            pending = {
              icon = "",
            },
            uncertain = {
              icon = "",
            },
            cancelled = {
              icon = "⏻",
            },
            recurring = {
              icon = "",
            },
          }
        }
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          lorg = "~/sync/lorg/notes/",
          gorg = "~/sync/lorg/gtd/",
          jrnl = "~/sync/lorg/jrnl/"
        },
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.presenter"] = {
      config = {
        zen_mode = "truezen",
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gorg",
      }
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {
      config = {
        extensions = {
          "todo-items-basic",
          -- "todo-items-pending" --maybe?
        }
      }
    },
    ["core.norg.journal"] = {
      config = {
        workspace = "jrnl",
        folder = "jrnl",
        strategy = "nested",
      }
    }
  },
})
