SMODS.Atlas{
    key = 'Vero2',
    path = 'vero2.png',
    px = 71,
    py = 95
}

SMODS.ConsumableType {
    key = 'VeroTarots',
    default = 'vero_tarots',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    collection_rows = { 7, 8 },
    shop_rate = 4
}

SMODS.Consumable {
    key = 'glizzy_tarot',
    loc_txt = {        
        name = 'Glizzy',
        text = {
            'Glizzy'
        } 
    },
    atlas = 'Vero2',
    pos = {x = 0, y = 0}
}