-- useful functions
local M = {}

M.get_username = function()
    local username = os.getenv("%USERNAME%") or os.getenv("USER")
    return username:gsub("^%l", string.upper)
end

M.quote_dragon = function()
    local quotes = {
        "Truly wonderful the mind of a child is. - Master Yoda",
        "Feel the force! - Master Yoda",
        "Disgusting KFC Chicken, I smell. - Master Yoda?",
        "You will find only what you bring in. - Master Yoda",
        "Give off light, or darkness, Padawan. Be a candle, or the night. - Master Yoda",
        "Size matters not. - Master Yoda",
        "Jeff Who? - Elon Musk",
        "Where is the chocolate. - Anonymous",
        "A man consists of Flesh, Water, and some other stuff. - Me",
        "The Lamp turns on when you press a button. - M. Lara K.",
        "Only a symbolic amount of coffee, sir. - M. I. K.",
        "do be do be do. - Scooby Do", -- apparently
        "",
    }

    return quotes[math.random(#quotes)]
end

M.fortune = function()
    local handle = io.popen("fortune -s")
    local fortune = handle:read("*a")
    handle:close()

    return fortune
end

M.christmas_check = function()
    local handle = io.popen("printf \"$(date '+%d.%m')\"")
    local date = handle:read("*a")
    handle:close()

    if date == "24.12" or date == "25.12" or date == "26.12" then
        return true
    else
        return false
    end
end

M.mapper = function()
    local X = {}

    local function is_module_available(name)
        if package.loaded[name] then
            return true
        else
            for _, searcher in ipairs(package.searchers or package.loaders) do
                local loader = searcher(name)
                if type(loader) == "function" then
                    package.preload[name] = loader
                    return true
                end
            end
            return false
        end
    end

    if is_module_available("nvim-mapper") then
        local mapper = require("nvim-mapper")

        X.map = function(mode, keys, cmd, options, category, unique_identifier, description)
            mapper.map(mode, keys, cmd, options, category, unique_identifier, description)
        end
        X.map_buf = function(bufnr, mode, keys, cmd, options, category, unique_identifier, description)
            mapper.map_buf(bufnr, mode, keys, cmd, options, category, unique_identifier, description)
        end
        X.map_virtual = function(mode, keys, cmd, options, category, unique_identifier, description)
            mapper.map_virtual(mode, keys, cmd, options, category, unique_identifier, description)
        end
        X.map_buf_virtual = function(mode, keys, cmd, options, category, unique_identifier, description)
            mapper.map_buf_virtual(mode, keys, cmd, options, category, unique_identifier, description)
        end
    else
        X.map = function(mode, keys, cmd, options, _, _, _)
            vim.api.nvim_set_keymap(mode, keys, cmd, options)
        end
        X.map_buf = function(mode, keys, cmd, options, _, _, _)
            vim.api.nvim_buf_set_keymap(mode, keys, cmd, options)
        end
        X.map_virtual = function(_, _, _, _, _, _, _)
            return
        end
        X.map_buf_virtual = function(_, _, _, _, _, _, _)
            return
        end
    end

    return X
end

M.drama_quotes= function ()
    math.randomseed(os.time())
    local messages = {
        "The Legend of NeoVim!",
        "Eating fishes are we gollum?",
        "LOTR Chad",
        "memes are great",
        "hey there",
    }
    return messages[math.random(1, #messages)]
end

return M
