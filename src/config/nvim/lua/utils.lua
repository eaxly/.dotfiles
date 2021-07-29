-- useful functions
local M = {}

M.get_username = function()
    local win = os.getenv("%USERNAME%") --why not convert here? if win is nil, we are trying to do the conversion on a nil value. We are, in a way, dividing by zero. and even my automcompletion says: 2/0 = inf <- error propably. I should stop talking...
    local unix = os.getenv("USER")

    if not unix then
        return win:gsub("^%l", string.upper)
    else
        return unix:gsub("^%l", string.upper)
    end
end


M.quote_dragon = function()
    local quotes = {
        "Truly wonderful the mind of a child is. - Master Yoda",
        "Feel the force! - Master Yoda",
        "Disgusting KFC Chicken, I smell. - Master Yoda",
        "You will find only what you bring in. - Master Yoda",
        "Give off light, or darkness, Padawan. Be a candle, or the night. - Master Yoda",
        "Size matters not. - Master Yoda",
    }

    return ": " .. quotes[math.random(1, #quotes)]
end


return M
