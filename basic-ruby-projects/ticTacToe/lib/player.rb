class Player
  attr_accessor :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def to_s
    "#{@name} - #{@marker}; Score: #{@score}"
  end
end
