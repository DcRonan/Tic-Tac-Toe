def get_player(default_name = 'Player 1')
  player_name = gets.chomp
  player_name.split.empty? ? default_name : player_name
end

def make_unique_name(name1, name2)
  name2 += ' #2' if name2 == name1
  name2
end
