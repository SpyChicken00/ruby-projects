class Player 
  attr_accessor :score, :name
  
  def initialize(name = "Player")
    @score = 0
    @name = name
  end

end