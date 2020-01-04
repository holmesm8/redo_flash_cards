require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


class RoundTest < Minitest::Test

  def test_it_exists
    new_deck = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, new_deck
  end

  def test_it_has_filename
    new_deck = CardGenerator.new("cards.txt")
    assert_equal "cards.txt", new_deck.filename
  end
end
