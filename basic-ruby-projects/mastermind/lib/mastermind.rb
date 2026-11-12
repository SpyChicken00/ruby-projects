require_relative "player"
require_relative "code_creator"

class Mastermind 
  def initialize
    @guessor = Player.new()
    @creator = CodeCreator.new()
  end

  def start
    welcome_message
    #choose_role
    game_loop
    play_again?
  end

  private

  def choose_role
    puts "Do you want to be the code creator? Y / N "
    if (gets.chomp.downcase == "y")
      #@creator = PlayerCreator.new 
      #@guessor = ComputerGuessor.new
      puts "Swapped roles"
    end
    puts "-----------Let's Go!--------------"
  end

  def game_loop
    guess = ""
    turn_num = 1
    
    while (turn_num <= 12) do
      puts "Please enter a 4-digit code with numbers 1-6"
      guess = gets.chomp
      exit if (guess == "q")
      if @creator.code_match?(guess) 
        puts "That's Right! You Win!!"
        @guessor.score += 1
        return
      end
      puts "Turn #{turn_num}/12  Guess: #{guess} Feedback: #{@creator.feedback(guess)}"
      turn_num += 1
    end

    puts "Out of Guesses! Code Creator Wins!!"
    @creator.score += 1
  end

  def play_again?
    puts "Play Again? Y / N"
    if (gets.chomp.downcase == "y")
      puts "Let's play again!"
      @creator.change_code()
      #choose_role
      game_loop
      play_again?
    end
  end

  def welcome_message
    puts "-------------------------"
    puts "Lets Play Mastermind!"
    puts "-------------------------"
  end

end