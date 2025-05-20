
SMODS.Joker{
    key = 'veroboarder', --- 50% chance to give a 2x multiplier.
    loc_txt = {
        name = 'Vero Boarder',
        text = {
            '{C:green}#2# in #3#{} chance',
            'to give {X:mult,C:white}X#1#{} mult'
        } 
    },
    atlas = 'Vero',
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 3,
    config = { extra = {
        Xmult = 2,
        odds = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            if pseudorandom('veroboarder') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'X' .. card.ability.extra.Xmult,
                    colour=G.C.MULT
            }
            end
        end
    end

}