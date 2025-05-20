SMODS.Consumable {
    key = 'glizzy',
    loc_txt = {        
        name = 'Glizzy',
        text = {
            'Glizzy'
        } 
    },
    set = 'VeroCons',
    atlas = 'Vero2',
    pos = {x = 0, y = 0}
}

SMODS.ConsumableType {
    key = 'VeroCons',
    default = 'verocons',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    collection_rows = { 7, 8 },
    shop_rate = 4
}
