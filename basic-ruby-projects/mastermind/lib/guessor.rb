class SecretCode
  def initialize(code)
    @code = code
  end
  def match?(guess)
    guess == @code
    # if false give feedback? or separate method
  end

  def feedback
    # tell how close the guess was, how many red pegs how many white
  end
end