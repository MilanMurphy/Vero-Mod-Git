SMODS.Joker{
    key = 'glizzyjoker', --- Scores "chips", chips increases his value by +15 after selecting blind, oh, it also says glizzy overload.
    loc_txt = {        
        name = 'Glizzy Joker',
        text = {
            'Consumes {C:dark_edition}Glizzy{} and',
            'gains {C:chips}+#2#{} chips',
            'after selecting a blind',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
        } 
    },
    atlas = 'Vero',
    blueprint_compat = false,
    pos = {x = 5, y = 0},
    rarity = 3,
    cost = 5,
    config = { extra = {
        chips = 0,
        chip_mod = 15
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chip_mod}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
            card:juice_up(0.8, 0.8)
            return {
                    message = '+' .. card.ability.extra.chip_mod .. ' Chips',
                    colour = G.C.CHIPS,
                }
        end
        
        
        if context.joker_main then 
            return {
                chips = card.ability.extra.chips,
                message = 'GLIZZY OVERLOAD',
                colour = G.C.CHIPS
            }
        end
    end
}