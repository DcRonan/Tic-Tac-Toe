require './lib/game'

describe Game do
  let(:game) { Game.new([1, 2, 3, 4], 'Daniel', 'Ronan') }

  describe '#initialize' do
    it 'Checks if the given player names are correct' do
      expect(game.players).to eq("O"=>"Ronan", "X"=>"Daniel")
    end

    it 'Checks if the game is still running' do
      expect(game.still_playing).to be true
    end

    it 'Checks if the game is still running' do
      expect(game.still_playing).not_to be false
    end

    it 'Checks if the board contains the given array' do
      expect(game.board).to eq([1, 2, 3, 4])
    end

    it 'Checks if the board is not equal to the given array' do
      expect(game.board).not_to eq([1, 2, 3, 4, 5])
    end

    it 'Checks if the game piece is an \'X\'' do
      expect(game.game_piece).to eq('X')
    end

    it 'Checks if the game piece is not a \'O\'' do
      expect(game.game_piece).not_to eq('O')
    end
  end
end