require './lib/card'
require './lib/turn'
require 'rspec'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'exists' do
        turn = Turn.new("Juneau", card) 
        expect(turn).to be_instance_of(Turn)
      end

      it 'has a guess' do
        turn = Turn.new("Juneau", card) 
        expect(turn.guess).to eq("Juneau")
      end
    
      it 'has an answer' do
        turn = Turn.new("Juneau", card) 
        expect(card.answer).to eq("Juneau")
      end

    it 'is correct' do
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to be true
    end 
  
    it 'gives feedback' do
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end 

end 


