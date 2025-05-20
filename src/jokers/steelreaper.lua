SMODS.Joker{
    key = 'steelreaper', --- +30 mult, gives an "odds" chance to remove all jokers at the end of each round.
    loc_txt = {        
        name = 'Steel Reaper',
        text = {
            '{C:mult}+#1#{} mult',
            '{C:green}#2# in #3#{} chance to',
            'destroy all jokers in',
            'hand at end of round'
        } 
    },
    atlas = 'Vero',
    blueprint_compat = false,
    pos = {x = 3, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        odds = 30,
        mult = 30   
        } 
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
    end,
    calculate = function(self,card,context)
        
        if context.end_of_round and not context.blueprint then
        if pseudorandom('veroboarder') < G.GAME.probabilities.normal / card.ability.extra.odds then
                for _, area in ipairs({G.jokers}) do
                    for _, other_card in ipairs(area.cards) do
                        other_card:start_dissolve()
                    end
                end
            end
        end
        if context.joker_main then
            return {
            mult = card.ability.extra.mult
            }
        end
    
    end
}