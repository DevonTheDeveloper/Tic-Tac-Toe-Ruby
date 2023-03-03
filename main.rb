# frozen_string_literal: true

def play_game
  puts 'Game starting...'
end

# Board for Tic Tac Toe
class Board
  def initialize
    @board_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    puts "       #{@board_squares[0]} | #{@board_squares[1]} | #{@board_squares[2]}
      ---+---+---
       #{@board_squares[3]} | #{@board_squares[4]} | #{@board_squares[5]}
      ---+---+---
       #{@board_squares[6]} | #{@board_squares[7]} | #{@board_squares[8]}"
  end

  def move_symbol(symbol)
    puts 'Place your symbol, use numbers 1-9'
    position = gets.chomp
    @board_squares[position.to_i - 1] = symbol
    show_board
  end
end

# Everything player related class
class Player
  attr_reader :symbol, :name

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# Logic for Tic Tac Toe
class Game
  player1 = Player.new('Player 1', 'X')
  player2 = Player.new('Player 2', 'O')

  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                          [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def check_win?
    WINNING_COMBINATIONS.each do |combo|
      return true if combo.all? { |square| square == 'X' }
    end
    false
  end
end
