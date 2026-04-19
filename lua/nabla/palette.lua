-- Flat, semantic color palette for the nabla colorscheme.
--
-- Color-role mapping (from the theme's design):
--   blue    -> functions, function-adjacent
--   cyan    -> secondary/aqua accents
--   green   -> namespaces, identifiers, diff-add
--   purple  -> types, keywords
--   yellow  -> constants, numbers
--   orange  -> warnings, literals
--   red     -> errors, deletes
--
-- Backgrounds get a subtle blue tint. Dark theme only.

return {
    none = "none",

    bg = {
        base    = "#06080a",
        dim     = "#141b24",
        soft    = "#1a212e",
        muted   = "#21283b",
        surface = "#283347",
        overlay = "#2a324a",
    },

    fg = {
        base   = "#93a4c3",
        muted  = "#6c7d9c",
        dim    = "#455574",
        faint  = "#1c4a6e",
        accent = "#256a9e",
    },

    blue = {
        light  = "#BEE6FF",
        soft   = "#80CDFF",
        base   = "#53a6d8",
        deep   = "#2D82B5",
        darker = "#015C92",
        pure   = "#006aff",
    },

    cyan = {
        light = "#17d9ff",
        base  = "#0dfff1",
        mint  = "#7fffd4",
        teal  = "#00c19e",
        pale  = "#a8dee0",
    },

    green = {
        light = "#26E277",
        base  = "#00FA9A",
        neon  = "#6aff08",
        lime  = "#1fff00",
        leaf  = "#1ae56a",
        olive = "#94b447",
        deep  = "#00A754",
        dim   = "#5d6e1e",
    },

    yellow = {
        light = "#dfff0f",
        base  = "#cfe601",
        warm  = "#fff000",
        sand  = "#ecd59f",
    },

    orange = {
        base = "#FFA500",
        deep = "#ff6b01",
        warm = "#fbc78e",
    },

    red = {
        light = "#ff7ba9",
        base  = "#ff4b21",
        deep  = "#c80064",
    },

    purple = {
        soft  = "#BFB8DA",
        light = "#E8B7D4",
        pink  = "#ee4392",
        hot   = "#ff00a2",
        base  = "#82218B",
        deep  = "#a000a0",
        neon  = "#7700ff",
    },

    diff = {
        add    = "#27341c",
        delete = "#331c1e",
        change = "#102b40",
        text   = "#1c4a6e",
    },
}
