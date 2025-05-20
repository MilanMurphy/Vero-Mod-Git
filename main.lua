if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 32,
        py = 32
    })
end
--- adds mod icon

assert(SMODS.load_file("src/jokers/jokers.lua"))() --- loads jokers

assert(SMODS.load_file("src/glizzycons/glizzycons.lua"))() -- loads glizzycons

assert(SMODS.load_file("src/ui/glizzy_ui.lua"))() -- loads ui shit
