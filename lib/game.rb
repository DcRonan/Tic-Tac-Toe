class Game
  attr_reader :board, :players
  attr_accessor :game_piece

  def initialize(board, player1, player2)
    @game_piece = 'X'
    @board = board
    @players = { 'X' => player1, 'O' => player2 }
  end

  def current_player
    @players[@game_piece]
  end

  def win_draw
    @board.win_or_draw
  end
end
