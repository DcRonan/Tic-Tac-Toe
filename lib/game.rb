class Game
  def initialize(board, player1, player2)
    @game_piece = 'X'
    @board = board
    @players = { 'X' => player1, 'O' => player2 }
    @still_playing = true
  end
end