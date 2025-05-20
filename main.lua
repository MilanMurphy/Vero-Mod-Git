if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 32,
        py = 32
    })
end

SMODS.Atlas{ --- Atlas for Jokers
    key = 'Vero',
    path = 'vero.png',
    px = 71,
    py = 95
}

SMODS.Atlas{ --- Atlas for Tarots
    key = 'Vero2',
    path = 'vero2.png',
    px = 71,
    py = 95
}

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/tarots.lua"))()