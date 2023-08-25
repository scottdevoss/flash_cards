class Round
  attr_reader :deck, :turns, :number_correct, :correct, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct = []
    @current_card = 0
  end 

  def current_card
    deck.cards.first
  end 

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    require 'pry'; binding.pry
    @deck.cards.rotate(1).first
    turn
  end 

  def number_correct
    @number_correct += 1
  end

end 