#!/usr/bin/env ruby
# rubocop:disable Naming/VariableNumber
# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/StringConcatenation

require './lib/board'
require './lib/human_player'

class Game
  attr_accessor :board, :grid

  @@board = Board.new
  def initialize(mark_1, mark_2)
    @player_1 = HumanPlayer.new(mark_1)
    @player_2 = HumanPlayer.new(mark_2)
    @current_player = @player_1
  end

  attr_reader :current_player

  def printing(arr)
    print " +---+---+---+ \n"
    arr.each do |sub_arr|
      sub_arr.each do |ele|
        print ' | '
        print ele
      end
      print " | \n"
      print " +---+---+---+ \n"
    end
  end

  def intro
    puts 'Enter Player-1 name:'
    @player_1_name = gets.strip.chomp.capitalize
    while @player_1_name.empty?
      print 'You can\'t leave this empty. Please, enter you name '
      puts
      @player_1_name = gets.strip.chomp.capitalize
    end

    puts 'Enter Player-2 name:'
    @player_2_name = gets.strip.chomp.capitalize
    while @player_2_name.empty?
      print 'You can\'t leave this empty. Please, enter you name '
      puts
      @player_2_name = gets.strip.chomp.capitalize
    end
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
      @current_player_name = @player_1_name

    elsif @current_player == @player_2
      @current_player = @player_1
      @current_player_name = @player_2_name
    end
  end

  def clearing_screen
    system 'cls'
    system 'clear'
  end

  def play
    intro
    puts "#{@player_1_name} plays as X and #{@player_2_name} as O"
    @current_player_name = @player_2_name

    while @@board.empty_positions?
      clearing_screen

      printing(@@board.grid)
      puts "#{@current_player_name}'s(#{@current_player.mark_value}) turn. please, Enter a number between 1 -- 9 :"

      begin
        str = gets.chomp.to_i
        pos = @current_player.get_position(str) if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(str)
      rescue StandardError
        retry if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(str) == false
      end

      @@board.place_mark(pos, @current_player.mark_value)
      if @@board.win?(@current_player.mark_value)
        clearing_screen
        printing(@@board.grid)
        puts 'Game Over'
        puts @current_player_name + " (#{@current_player.mark_value})" + ' HAS WON!'
        return
      else
        switch_turn
        clearing_screen
      end
    end

    puts 'Game Over'
    puts 'DRAW'
  end
end

# rubocop:enable Naming/VariableNumber
# rubocop:enable Metrics/MethodLength
# rubocop:enable Style/StringConcatenation

b = Game.new('X', 'O')
b.play
