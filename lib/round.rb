class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    find_correct = @turns.find_all {|turn| turn.correct?}
    find_correct.count
  end

  def number_correct_by_category(category)
    find_cat = @turns.find_all {|turn| turn.card.category == category}
    find_cat.count {|turn| turn.correct?}
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) /
    (@turns.find_all {|turn| turn.card.category == category}).count) * 100
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-----------------------------------------------------"
    until @turns.count == @deck.count
      puts "This is card number #{@turns.count + 1} out of #{@deck.count}."
      puts "Question: #{@deck.cards.first.question}"
      take_turn(gets.chomp)
      puts "#{@turns.last.feedback}"
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@deck.count} for a total score of #{(number_correct / @deck.count) * 100}%."
    puts "History - #{percent_correct_by_category("STEM")}% correct"
    puts "Sports - #{percent_correct_by_category("Turing Staff")}% correct"
    puts "Geography - #{percent_correct_by_category("PopCulture")}% correct"
  end
end
