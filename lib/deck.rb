class Deck
  attr_reader :cards, :count, :category_deck
  def initialize(cards)
    @cards = cards
    @count = cards.length
    @category_deck = []
  end 

  def cards_in_category(category_filter)
    @category_deck = @cards.select do |card| 
      card.category == category_filter
    end 
  end 
end 