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

game_piece = 'X'

loop do
  puts display_board(board)
  square_number = gets.chomp.to_i
  board[square_number - 1] = game_piece
  game_piece = game_piece == 'X' ? 'O' : 'X'
end
