require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Card, card
  end

  def test_it_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
    assert_equal "Juneau", turn.guess
  end

  def test_the_guess_is_correct_or_incorrect_with_proper_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
    assert_equal "Correct!", turn.feedback

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal false, turn.correct?
    assert_equal "Incorrect.", turn.feedback
  end
end
