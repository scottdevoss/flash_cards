require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'
require 'pry'

RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new([card_1, card_2, card_3])

  it 'exists' do
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end 

  it 'has a deck' do
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end 

  it 'has turns' do
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end

  it 'takes current card' do
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end 

  it 'can take a turn and create turn instance' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
  end 

  it 'can be correct' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(new_turn.correct?).to be true
  end

  it 'is the correct number' do
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.number_correct).to eq(1)
  end

  it 'can remember turns taken' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn])
  end

  it 'goes to next card' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.current_card).to eq(card_2)
  end

  xit 'can store the number of turns and correct answers' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.turns.count).to eq(2)
  end

  xit 'can give feedback from turns taken' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

  xit 'can find number of correct answers by category' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.number_correct_by_category(:Geography)).to eq(1)
  end

  xit 'can find percent correct' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.percent_correct).to eq(50)
  end


  xit 'can find percent correct by category' do
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    expect(round.percent_correct_by_category(:Geography)).to eq(100)
  end

end 