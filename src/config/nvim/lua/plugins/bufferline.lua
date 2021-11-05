require('bufferline').setup {
    options = {
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 24,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 25,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level)
            return "("..count.." "..level..")"
        end,
        offsets = {{filetype = "NvimTree", }},
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "padded_slant",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'relative_directory',
    }
}

