require 'card_processor'
require 'card'

RSpec.describe CardProcessor do
  let(:processor) { CardProcessor.new }

  describe '#process_cards' do
    context 'adding a new valid card' do
      it 'adds a new valid card' do
        processor.process_cards('Add Tom 4111111111111111 $1000')
        expect(processor.instance_variable_get(:@cards)).to have_key('Tom')
      end
    end

    context 'transactions with a card' do
      before do
        processor.process_cards('Add Tom 4111111111111111 $1000')
        processor.process_cards('Add Lisa 5454545454545454 $3000')
      end
      it 'charges a card' do
        processor.process_cards('Charge Tom $500')
        expect(processor.instance_variable_get(:@cards)['Tom'].balance).to eq(500)
      end

      it 'credits balance to the card' do
        processor.process_cards('Credit Lisa $100')
        expect(processor.instance_variable_get(:@cards)['Lisa'].balance).to eq(-100)
      end 
    end

    context 'validating error cards' do
      it 'returns error for invalid card' do
        processor.process_cards('Add Quincy 1234567890123456 $2000')
        expect(processor.instance_variable_get(:@cards)['Quincy']).to eq('error')
      end
    end
  end
end
