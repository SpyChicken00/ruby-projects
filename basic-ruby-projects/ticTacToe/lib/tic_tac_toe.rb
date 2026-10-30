require_relative "player"
require_relative "board"

class TicTacToe
  attr_accessor :player1, :player2

  def initialize
    @player1 = Player.new("Player1", "X")
    @player2 = Player.new("Player2", "O")
    @board = Board.new
  end

  def start
    update_names
    # game_loop()
  end

  private

  def game_loop
    active_player = @player1
    until board.three_in_row?
      # player turn, alternate with local variable?

      active_player = active_player == @player1 ? @player2 : @player1
    end
  end

  def update_names
    puts "Player 1: Please choose a name:"
    player1.name = gets.chomp
    puts "Player 2: Please choose a name:"
    player2.name = gets.chomp
    puts "#{player1.name}, #{player1.marker}"
    puts "#{player2.name}, #{player2.marker}"
  end
end
