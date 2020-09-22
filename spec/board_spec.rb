require './lib/board'
require './lib/game'

describe Board do
  let(:board) { Board.new }
  let(:symbol) { 'X' }

  describe '#valid_square?' do
    it 'Checks if a valid square is given' do
      expect(board.valid_square?(7)).to eq(7)
    end

    it 'Checks if a valid square is given and not equal to the sqaure given' do
      expect(board.valid_square?(7)).not_to eq(8)
    end
  end
end
