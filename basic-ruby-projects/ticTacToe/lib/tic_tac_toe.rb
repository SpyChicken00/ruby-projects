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
    welcome_message
    game_loop
  end

  private

  def game_loop
    active_player = @player2
    until (winner? || cats_game?)
      active_player = active_player == @player1 ? @player2 : @player1
      location = ""
      loop do
        @board.print_board
        puts "#{active_player.name}, please choose a location with two letters:"
        location = gets.chomp.upcase
        break if @board.location_valid?(location)
      end
      @board.place_marker(location, active_player.marker)
    end

    victory(active_player)
  end

  def welcome_message
    puts "-------------------------"
    puts "Lets Play Tic-Tac-Toe!"
    puts "-------------------------"
    puts "Top Middle Bottom; Left Middle Right; Example: Top Left -> TL)"
    puts "-------------------------"
  end

  def victory(winner)
    @board.print_board
    unless (cats_game?)
      puts "#{winner.name} wins!"
      winner.score += 1
    end
    puts @player1
    puts @player2
    play_again
  end

  def play_again
    loop do
      puts "Play again? Y / N"
      input = gets.chomp.downcase
      if (input == "y" || input == "yes")
        puts "Lets Play Again!!! Resetting board..."
        @board.reset
        game_loop
      else
        exit_message
        exit
      end
    end
  
  end

  def exit_message
    puts "-------------------------"
    puts "Thanks for playing! Bye Bye ;)"
    puts "-------------------------"
  end

  def cats_game?
    draw = @board.full? 
    puts "Cats Game!" if draw
    draw
  end

  def winner?
    @board.three_in_row?
  end

  def update_names
    puts "Player 1: Please choose a name:"
    name = gets.chomp
    @player1.name = name unless (name == "")
    
    puts "Player 2: Please choose a name:"
    name = gets.chomp
    @player2.name = name unless (name == "")
  end
end
