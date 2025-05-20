SMODS.Atlas{ --- Atlas for glizzycards
    key = 'Vero2',
    path = 'vero2.png',
    px = 71,
    py = 95
}

SMODS.ConsumableType {
    key = 'VeroCons',
    loc_txt = {
        collection = 'Vero Cards',
        name = 'Vero Cards',
        label = 'Vero Cards',
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            },
        },
    },
    default = 'verocons',
    primary_colour = G.C.DARK_EDITION,
    secondary_colour = G.C.DARK_EDITION,
    collection_rows = { 7, 8 }, 
    shop_rate = 4
}

assert(SMODS.load_file("src/glizzycons/glizzy.lua"))()
