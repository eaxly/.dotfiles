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
        "A man consists of Flesh, Water, and some other stuff. - Anonymous",
        "The Lamp turns on when you press a button. - M. Lara K.",
        "Only a symbolic amount of coffee, sir. - M. I. K.",
        "do be do be do. - Scooby Do", -- apparently
    }

    return quotes[math.random(#quotes)]
end
return M
