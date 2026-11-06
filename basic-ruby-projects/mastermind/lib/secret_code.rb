class SecretCode
  attr_reader :length 

  def initialize(code_string)
    @code = code_string.to_s
    @length = @code.length
  end

  def match?(guess)
    guess == @code
  end

  def feedback(guess)
    red = red_pins(guess); #correct char in position
    white = white_pins(guess)   #correct char, incorrect position
    "#{red}R#{white}W" # return as string like "2R2W"
  end

  private 
  def red_pins(guess)
    red = 0;
    @length.times do |i|
      if @code[i] == guess[i]
        red += 1 
        guess[i] = "X" #mark off char in guess
      end
    end
    red
  end

  def white_pins(guess)
    p "DEBUG: guess is now  #{guess}" #DELETE
    white = 0
    @code.split("").each do |char|
      if guess.include?(char) 
        white += 1
        guess[guess.index(char)] = "X" #mark off char in guess
        p "DEBUG guess is now  #{guess}" #DELETE
      end
    end
    white
  end
end

code = SecretCode.new("1234")
guess = "1243"
p code.match?(guess) ? "Yay! That's Right" : code.feedback(guess)
#TODO TEST EDGE CASES OF VARIOUS CODES