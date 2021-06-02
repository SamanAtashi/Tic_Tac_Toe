#!/usr/bin/env ruby
puts "Welcome to Tic_Tac_Toe Game"

puts "Enter Player-1 name:"
player_1=gets.chomp
while player_1.empty?
  print 'You can\'t leave this empty. Please, enter you name '
    puts
  player_1 = gets.strip.chomp.capitalize
end

puts "Enter Player-2 name:"
player_2=gets.chomp
while player_2.empty?
  print 'You can\'t leave this empty. Please, enter you name '
    puts
  player_2 = gets.strip.chomp.capitalize
end
#! -------------------------------------------------------
puts
puts "#{player_1} will play as X and #{player_2} as O"
puts
puts "Let the game begin!!!"
#! -------------------------------------------------------
grid="+---+---+---+ \n| 1 | 2 | 3 | \n+---+---+---+ \n| 4 | 5 | 6 | \n+---+---+---+ \n| 7 | 8 | 9 | \n+---+---+---+ "
#! -------------------------------------------------------
gameover=false
until gameover
    puts grid   
    puts 
    puts "It's #{player_1}s turn"
    puts 'Please select an available cell from the board...'
    begin
        cell = gets.chomp.match(/[1-9]/)[0]
    rescue StandardError
        puts 'Enter valid number, please!!!'
        retry
    end
    puts "It's #{player_2}s turn"
    puts 'Please select an available cell from the board...'
    begin
        cell = gets.chomp.match(/[1-9]/)[0]
    rescue StandardError
        puts 'Enter valid number, please!!!'
        retry
    end

    gameover=true
end

puts "It's a Tie!!!"