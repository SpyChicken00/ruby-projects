require_relative "player"
require_relative "code_creator"

class Mastermind 
  def initialize
    @guessor = Player.new()
    @creator = CodeCreator.new()
    @swapped = false
  end

  def start
    welcome_message
    choose_role ? mastermind_game_loop : guess_game_loop
    play_again?
  end

  private

  def choose_role
    puts "Do you want to be the mastermind? Y / N "
    if (gets.chomp.downcase == "y")
      swap unless @swapped
    else
      swap if @swapped
    end
    puts "-----------Let's Go!--------------"
    @swapped
  end

  def swap
    @creator, @guessor = @guessor, @creator
    puts "Swapped roles"
    @swapped = @swapped ? false : true
  end

  def guess_game_loop 
    guess = ""
    turn_num = 1
    
    while (turn_num <= 12) do
      puts "Please guess a 4-digit code with numbers 1-6"
      guess = gets.chomp
      exit if (guess == "q")
      if @creator.code_match?(guess) 
        guessor_win
        @creator.reset
        return
      end
      puts "Turn #{turn_num}/12  Guess: #{guess} Feedback: #{@creator.feedback(guess)}"
      turn_num += 1
    end

    code_creator_win
    @creator.reset
  end

  def mastermind_game_loop #where computer guesses code and you tell it what to do
    turn_num = 1;
    while (turn_num <= 12) do
      
      guess = @guessor.guess_num() #TODO computer spits out random number
      puts "Turn #{turn_num}/12  Guess: #{guess}"
      puts "Please give feedback for how many red/white nums (Ex: 2R1W). If the code is right, say BINGO!"
      feedback = gets.chomp #user gives feedback, like 0R1W or BINGO for correct guess
      exit if (feedback.downcase == "q")
      if (feedback.downcase == "bingo")
        guessor_win
        return
      end
      puts feedback.upcase
      @guessor.consider(guess, feedback.upcase)
      turn_num += 1
    end

    code_creator_win
    @guessor.reset
  end

  def code_creator_win
    puts "#{@guessor.name} out of guesses, #{@creator.name} wins!!"
    @creator.score += 1
  end

  def guessor_win
    puts "That's Right! #{@guessor.name} wins!!"
    @guessor.score += 1
  end

  def play_again?
    puts "Score: #{@guessor.name}:#{@guessor.score} vs #{@creator.name}:#{@creator.score}"
    puts "Play Again? Y / N"
    if (gets.chomp.downcase == "y")
      puts "Let's play again!"
      choose_role ? mastermind_game_loop : guess_game_loop
      play_again?
    else
      if (@guessor.score > @creator.score)
        puts "#{@guessor.name} is the mastermind champion"
      else
        puts "#{@creator.name} is the mastermind champion"
      end
    end
    
  end

  def welcome_message
    puts "-------------------------"
    puts "Lets Play Mastermind!"
    puts "Try to guess the code!"
    puts "-------------------------"
  end

end