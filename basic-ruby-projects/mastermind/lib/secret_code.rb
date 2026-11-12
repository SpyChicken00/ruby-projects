class SecretCode
  attr_reader :length, :code

  def initialize(code_string)
    @code = code_string.to_s
    @length = @code.length
  end

  def match?(guess)
    guess == @code
  end

  def feedback(g)
    guess = g.clone
    code_marked = @code.clone
    red = red_pins(guess, code_marked); #correct char in position
    white = white_pins(guess, code_marked)   #correct char, incorrect position
    "#{red}R#{white}W" # return as string like "2R2W"
  end

  private 
  def red_pins(guess, code_marked)
    red = 0;
    @length.times do |i|
      if code_marked[i] == guess[i]
        red += 1 
        guess[i] = "X" #mark off char in guess
        code_marked[i] = "X"
      end
    end
    red
  end

  def white_pins(guess, code_marked)
    white = 0
    code_marked.split("").each do |char|
      next if (char == "X")
      if guess.include?(char) 
        white += 1
        index = guess.index(char)
        guess[index] = "X" #mark off char in guess
        code_marked[index] = "X"
      end
    end
    white
  end
end

# code = SecretCode.new("2145")
# guess = "2121"
# p code.match?(guess) ? "Yay! That's Right" : code.feedback(guess)
# #TODO TEST EDGE CASES OF VARIOUS CODES

# guess = ""
# code = SecretCode.new("2122")
# guess = "2222"
# p code.match?(guess) ? "Yay! That's Right" : code.feedback(guess)
# p code.code


