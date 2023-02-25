# frozen_string_literal: true

def play_game
  puts 'Game starting...'
end

# Board for Tic Tac Toe
class Board
  def print_board
    puts " 1 | 2 | 3\n---+---+---\n 4 | 5 | 6\n---+---+---\n 7 | 8 | 9"
  end

  def initialize
    @board_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print_board
  end
end

# Everything player related class
class Player
  attr_accessor :name

  @amount_of_players = 0

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @amount_of_players += 1
  end
end

# Logic for Tic Tac Toe
class GameLogic
  play_game if @amount_of_players == 2
end