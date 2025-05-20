SMODS.Atlas{ --- Atlas for Jokers
    key = 'Vero',
    path = 'vero.png',
    px = 71,
    py = 95
}

assert(SMODS.load_file("/src/jokers/veroboarder.lua"))()
assert(SMODS.load_file("/src/jokers/veroflip.lua"))()
assert(SMODS.load_file("/src/jokers/chatgptog.lua"))()
assert(SMODS.load_file("/src/jokers/steelreaper.lua"))()
assert(SMODS.load_file("/src/jokers/dragonfruitpack.lua"))()
assert(SMODS.load_file("/src/jokers/glizzyjoker.lua"))()