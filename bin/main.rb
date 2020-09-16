require_relative '../lib/board'

puts 'WELCOME TO THIS TIC-TAC-TOE GAME: created by: '
puts "Press 'ENTER' to begin"
gets

puts "\nPlayer 1:"
player1 = gets.chomp

puts "\nPlayer 2:"
player2 = gets.chomp

puts 'Please choose a number between 1-9 to select your place!'

class Game
  def initialize(board, player1, player2)
    @game_piece = 'X'
    @board = board
    @players = { 'X' => player1, 'O' => player2 }
    @still_playing = true
  end

  def game_loop
    while @still_playing
      puts "#{@players[@game_piece]}'s take your turn!"
      puts @board.display
      puts 'Select a Square:'
      square_number = @board.pick_a_square do
        puts 'Please choose a valid square, choose between 1-9 and that hasn\'t been selected!'
      end
      @board.set_a_square(square_number, @game_piece)
      @game_piece = @game_piece == 'X' ? 'O' : 'X'
      wining_status = @board.win_or_draw
      break if %w[X O TIE].include?(wining_status)
    end

    puts @board.display
    winner = @players[wining_status]
    if winner
      puts "#{winner} wins this round."
    else
      puts "It's a TIE"
    end
  end
end

board = Board.new
game = Game.new(board, player1, player2)
game.game_loop
