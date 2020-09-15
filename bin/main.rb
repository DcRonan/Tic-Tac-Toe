puts 'WELCOME TO THIS TIC-TAC-TOE GAME: created by: '
puts "Press 'ENTER' to begin"
gets

puts "\nPlayer 1:"
player1 = gets.chomp

puts "\nPlayer 2:"
player2 = gets.chomp

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board)
  %(#{board[0]} | #{board[1]} | #{board[2]}
----------
#{board[3]} | #{board[4]} | #{board[5]}
----------
#{board[6]} | #{board[7]} | #{board[8]}
  )
end

chosen_moves = []

game_piece = 'X'

still_playing = true

while still_playing
  puts display_board(board)
  square_number = gets.chomp.to_i
  board[square_number - 1] = game_piece
  game_piece = game_piece == 'X' ? 'O' : 'X'

  if (1..9).cover?(square_number)
    if chosen_moves.include?(square_number)
      puts "That is invalid, go again"
      square_number = gets.chomp.to_i
    else
      chosen_moves.push(square_number)
    end
  end
  !still_playing
end
