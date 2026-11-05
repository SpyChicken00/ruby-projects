require_relative "player"
require_relative "code_creator"

class Mastermind 
  def initialize
    @guessor = Player.new
    @creator = CodeCreator.new
  end

  def start
    # setup and start the game for one round
    welcome_message
  end

  private

  def welcome_message
    puts "-------------------------"
    puts "Lets Play Mastermind!"
    puts "-------------------------"
    @creator.code
    #puts "Do you want to be the code creator? Y / N "
    #@guessor = gets.chomp.downcase == "y" ?  P
    # puts "-------------------------"
  end

end