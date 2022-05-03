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
          lorg = "~/sync/lorg/lorg", -- stands for life-org
          todo = "~/sync/lorg/todo"
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
        workspace = "todo",
      }
    }
  },
})
