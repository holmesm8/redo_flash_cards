require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
deck = Deck.new(CardGenerator.new('cards.txt').cards)
round = Round.new(deck)
round.start
