require_relative "player"

class TicTacToe
    attr_accessor :player1, :player2
    def initialize()
        #TODO ask user for player1 name, and X's or O's
        @player1 = Player.new("Player1", "X")
        @player2 = Player.new("Player2", "O")
        #@board = Board.new()

    end

    def start()
        updateNames()
        # gameLoop()
    end 

    private
    def gameLoop()
        activePlayer = @player1
        until (board.three_in_row?())
            # player turn, altnernate with local variable?
            


            #
            activePlayer = (activePlayer == @player1) ? @player2 : @player1
        end
    end
    def updateNames()
        puts "Player 1: Please choose a name:"
        self.player1.name = gets.chomp
        puts "Player 2: Please choose a name:"
        self.player2.name = gets.chomp
        puts "#{player1.name}, #{player1.marker}"
        puts "#{player2.name}, #{player2.marker}"
    end
end