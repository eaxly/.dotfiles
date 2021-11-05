local M = {}

function M.coq()
vim.g.coq_settings = {
    ["auto_start"] = true,
    ["display.preview.border"] = "rounded",
}
end

function M.third()
    require("coq_3p") {
        { src = "bc", short_name = "MATH", precision = 6 },
        { src = "cow" },
        -- { src = "figlet", short_name = "BIG" },
        -- { src = "demo" },
    }
end

return M
