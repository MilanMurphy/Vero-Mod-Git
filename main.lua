SMODS.Atlas{
    key = 'Vero',
    path = 'vero.png',
    px = 71,
    py = 95
}

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

SMODS.Joker{
    key = 'veroflip', --- Coin flip at the end of each round, if it lands on "0", your bankroll gets added to the round's reward
    loc_txt = {       --- if it lands on "1", your bankroll gets substracted to the round's reward.
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
                colour=G.C.MULT,
                message = 'ANYTHING FOR YOU VERO'
                }
            elseif selection > 75 and selection <= 95 then
                return{
                mult = modifier,
                message = 'ANYTHING FOR YOU VERO'
                }
            else 
                return{
                chips = modifier,
                message = '+' .. modifier,
                colour=G.C.CHIPS,
                message = 'ANYTHING FOR YOU VERO'
                }
            end
        end
    end
}

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

SMODS.Joker{
    key = 'dragonfruitpack',
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