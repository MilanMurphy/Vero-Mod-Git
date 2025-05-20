SMODS.Joker{
    key = 'dragonfruitpack', --- 20x mult, -5 to hand size.
    loc_txt = {        
        name = 'Dragonfruit Pack',
        text = {
            '{X:mult,C:white}X#1#{} mult',
            '{C:attention}-#2#{} hand size',
            '{C:dark_edition,s:1.5}"that shi got me FUCKED!"{}'
        } 
    },
    atlas = 'Vero',
    blueprint_compat = false,
    pos = {x = 4, y = 0},
    rarity = 2,
    cost = 3,
    config = { extra = {
        xmult = 20,
        h_size = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, card.ability.extra.h_size}}
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = 'X' .. card.ability.extra.xmult,
                colour=G.C.MULT
            }
        end
    end
}