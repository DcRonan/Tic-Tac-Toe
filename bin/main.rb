puts 'WELCOME TO THIS TIC-TAC-TOE GAME: created by: '
puts "Press 'ENTER' to begin"
gets

puts "\nPlayer 1:"
player1 = gets.chomp

puts "\nPlayer 2:"
player2 = gets.chomp

puts 'Please choose a number between 1-9 to select your place!'

class Board
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @selected_moves = []
  end

  def pick_a_square
    loop do
      square = gets.chomp.to_i - 1
      return square if !@selected_moves.include?(square) && square.between?(0, 8)

      yield()
    end
  end

  def set_a_square(idx, game_piece)
    @board[idx] = game_piece
    @selected_moves.push(idx)
  end

  def display
    %(
  #{@board[0]} | #{@board[1]} | #{@board[2]}
  ----------
  #{@board[3]} | #{@board[4]} | #{@board[5]}
  ----------
  #{@board[6]} | #{@board[7]} | #{@board[8]}
    )
  end

  def win_or_draw
    winning_numbers = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    status = nil
    winning_numbers.each do |n|
      if !@board[n[0]].nil? && @board[n[0]] == @board[n[1]] && @board[n[1]] == @board[n[2]]
        status = @board[n[0]]
        break
      end
    end

    status = 'TIE' if status.nil? && @selected_moves.length == 9

    status
  end
end

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
