require_relative '../lib/player'
describe Player do
  describe '#input' do
    context 'player input with check' do
      subject(:player_input) { described_class.new('X') }
      it 'valid input' do
        user_input = '3'
        check_input = player_input.input(user_input)
        expect(check_input).to eq('3')
      end
    end
  end
end
