SMODS.Joker{
    key = 'chatgptog', --- Rolls two random multipliers, one for chips/mult, another one for the selection of the modifier.
    loc_txt = {        --- 75% chance to give xmult, 20% chance to give +mult, 5% chance to give +chips.
        name = 'ChatGPT OG',
        text = {
            'Asks {C:green}ChatGPT{}',
            'what {C:mult}mult{} this joker',
            'should have'
        } 
    },
    atlas = 'Vero',
    blueprint_compat = false,
    pos = {x = 2, y = 0},
    rarity = 3,
    cost = 10,
    config = { extra = {
        dollars = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.Xmult, card.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.joker_main then 
            local modifier = math.random(0, 15)
            local selection = math.random(1,100)
            
            if selection <= 75 then
                return{
                Xmult_mod = modifier,
                message = 'X' .. modifier,
                colour = G.C.MULT,
                message = 'ANYTHING FOR YOU VERO',
                colour = G.C.MULT
                }
            elseif selection > 75 and selection <= 95 then
                return{
                mult = modifier,
                message = 'ANYTHING FOR YOU VERO', --- WHY THE FUCK DOES IT SHOW THE MESSAGE FOR THIS AND CHIPS BUT NOT FOR THE OTHER TWO????????????????????????
                colour = G.C.MULT
                }
            else 
                return{
                chips = modifier,
                message = 'ANYTHING FOR YOU VERO',
                }
            end
        end
    end
}