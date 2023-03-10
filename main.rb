# frozen_string_literal: true

def play_game
  puts 'Game starting...'
end

# Board for Tic Tac Toe
class Board
  attr_accessor :board_squares

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
    puts "\nPlace your symbol, use numbers 1-9\n"
    position = gets.chomp.to_i

    until position == @board_squares[position - 1] && !position.zero?
      puts "\nPlace your symbol, use numbers 1-9\n"
      position = gets.chomp.to_i
    end

    puts 'Incorrect, try again.' if position != @board_squares[position - 1] && !position.zero?

    # ↓ Makes the board square a symbol in the actual array, this is used for validation.
    !@board_squares[position - 1] = symbol
    show_board
  end
end

# Everything player related class
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# Logic for Tic Tac Toe
class Game
  def initialize
    @board = Board.new
    @curr_player = Player.new('Player 1', 'X')
    @next_player = Player.new('Player 2', 'O')

    puts "\nWelcome to Tic Tac Toe!\n"
  end

  WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],
                          [1, 5, 9], [3, 5, 7]].freeze
  # Checks if any player has a winning combination
  def check_win?
    WINNING_COMBINATIONS.each do |combo|
      return true if combo.all? do |square|
        @board.board_squares[square - 1] == @curr_player.symbol
      end
    end
    false
  end

  def full_board?
    return true if @board.board_squares.all? do |square|
      square == @curr_player.symbol || square == @next_player.symbol
    end

    false
  end

  def run
    loop do
      @board.move_symbol(@curr_player.symbol)

      break if check_win? || full_board?

      switch_player
    end

    if check_win? == true
      puts "#{@curr_player.name} has won the match!"
      play_again?
    elsif full_board? || check_win? == false
      puts 'Tie! Nobody has won.'
      play_again?
    end
  end

  def switch_player
    @curr_player, @next_player = @next_player, @curr_player
  end

  def play_again?
    return unless check_win? == true || full_board? == true

    puts "\nWould you like to play again? [y/n]"
    input = gets.chomp.downcase
    if input == 'y'
      Game.new.run
    else
      puts 'Goodbye!'
    end
  end
end

Game.new.run
