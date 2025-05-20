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