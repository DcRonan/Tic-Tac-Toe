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

  describe '#set_a_square' do
    it 'Sets the given square and symbol in the correct position on the board' do
      expect(board.set_a_square(4, symbol)).to eq([4])
    end

    it 'Checks if the given square and symbol is not eqaul to the given position' do
      expect(board.set_a_square(4, symbol)).not_to eq([5])
    end
  end

  describe '#win_or_draw' do
    it 'Checks if the game is not a Tie' do
      expect(board.win_or_draw).not_to eq('TIE')
    end

    it 'Checks if the game has a winner' do
      expect(board.win_or_draw).to eq(' ')
    end
  end
end
