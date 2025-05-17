SMODS.Atlas{
    key = 'Vero',
    path = 'vero.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'veroboarder',
    loc_txt = {
        name = 'Vero Boarder',
        text = {
            '{C:green}#2# in #3#{} chance to give {X:mult,C:white}X#1#{} mult'
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

SMODS.Joker{
    key = 'veroflip',
    loc_txt = {
        name = 'Coin Flip',
        text = {
            'At the end of each round,',
            'do a {C:green}coin flip{} for',
            'all of {C:money}banked cash{}.'
        } 
    },
    atlas = 'Vero',
    blueprint_compat = false,
    pos = {x = 1, y = 0},
    rarity = 1,
    cost = 0,
    config = { extra = {
        dollars = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.dollars * G.GAME.dollars}, G.GAME.dollars}
    end,

    calc_dollar_bonus = function(self, card)
        local bonus = 0
        if math.random(0,1) == 0 then
            bonus = G.GAME.dollars
        else bonus = G.GAME.dollars * -1
        end
        return bonus
    end
}

SMODS.Joker{
    key = 'chatgptog',
    loc_txt = {
        name = 'ChatGPT OG',
        text = {
            'Ask {C:green} Chat GPT{}',
            'what {C:red}mult{} this joker',
            'should have.'
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
                colour=G.C.MULT
                }
            elseif selection > 75 and selection <= 95 then
                return{
                mult = modifier,
                message = '+' .. modifier,
                colour=G.C.MULT 
                }
            else 
                return{
                chips = modifier,
                message = '+' .. modifier,
                colour=G.C.CHIPS
                }
            
            
            end
        end
    end
}