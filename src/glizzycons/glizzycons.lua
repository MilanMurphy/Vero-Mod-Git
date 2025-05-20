SMODS.Atlas{ --- Atlas for glizzycards
    key = 'Vero2',
    path = 'vero2.png',
    px = 71,
    py = 95
}

SMODS.ConsumableType {
    key = 'VeroCons',
    default = 'verocons',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    collection_rows = { 7, 8 },
    shop_rate = 4
}

assert(SMODS.load_file("src/glizzycons/glizzy.lua"))()
