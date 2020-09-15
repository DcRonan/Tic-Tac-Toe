puts 'WELCOME TO THIS TIC-TAC-TOE GAME: created by: '
puts "Press 'ENTER' to begin"
gets

puts "\nPlayer 1:"
player1 = gets.chomp

puts "\nPlayer 2:"
player2 = gets.chomp

board = ['', '', '', '', '', '', '', '', '']

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

def pick_a_square(board)
  loop do
    square = gets.chomp.to_i - 1
    if board[square] == '' && square.between?(0, 8) # if square is not a valid number: i.e is not in 1 - 9; occupied; 
      return square
    end
    puts "Please choose a valid square"
  end
end

while still_playing
  puts display_board(board)
  square_number =  pick_a_square(board)
  board[square_number] = game_piece
  game_piece = game_piece == 'X' ? 'O' : 'X' 
end
