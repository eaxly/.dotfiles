local lir = require('lir')
local actions = require('lir.actions')
local mark_actions = require('lir.mark.actions')
local clipboard_actions = require('lir.clipboard.actions')
-- lir plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function LirTrash()
    local ctx = require("lir").get_context()
    local current = ctx:current()
    local trash_cmd = "trash "

    local function get_user_input_char()
        local c = vim.fn.getchar()
        return vim.fn.nr2char(c)
    end

    print("Trash "..current.devicons.icon.." "..current.value.." "..current.devicons.icon.." ? [y/n] ")

    if (get_user_input_char():match('^y') and current) then
        vim.fn.jobstart(trash_cmd .. current.fullpath, {
            detach = true,
            on_exit = function () actions.reload() end,
        })
    end
    vim.api.nvim_command('normal <cmd>esc<CR>')
end

lir.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,
    ['<Esc>'] = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = LirTrash,

    ['J'] = function()
        mark_actions.toggle_mark()
        vim.cmd('normal! j')
    end,

    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
    ['<C-o>'] = function()
            local current = lir.get_context():current()

            vim.fn.jobstart("xdg-open "..current.fullpath, {
                            detach=true,
                            on_exit=function() actions.reload() end,
                            on_stderr=function() vim.cmd'echoerr "Couldn\'t open file!"' end
                        })
        end,
    },
    float = {
        winblend = 10,
        win_opts = function ()
            return {
                border = "rounded",
            }
        end,
        curdir_window = {
            enable = true,
            highlight = true,
        }
    },
    hide_cursor = true,
}

-- custom folder icon
require('nvim-web-devicons').set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#9ccfd8",
    name = "LirFolderNode"
  }
})

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require("lir.mark.actions").toggle_mark("v")<CR>', {noremap = true, silent = true})
end

-- plugins
require("lir.git_status").setup()

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

