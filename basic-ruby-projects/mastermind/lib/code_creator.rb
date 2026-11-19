require_relative "secret_code"
require_relative "player"
class CodeCreator < Player
  attr_accessor :remaining_codes
  def initialize
    super("Computer")
    @all_codes = gen_all_combinations
    reset
  end

  def guess_num
    puts @remaining_codes.length
    if (@remaining_codes.length == 1296)
      return @remaining_codes.delete("1122") 
    end
    #@remaining_codes.shift 
    @remaining_codes.sample
    
  end

  def consider(guess, feedback)
    # red = feedback.chars[0]
    # white = feedback.chars[2]
    puts @remaining_codes.length
    #TODO find way to remove ALL numbers that include guess_digits
    if (feedback.downcase == "0r0w")
      guess_digits = guess.chars.uniq
      @remaining_codes.each do |code_string|
        guess_digits.each do |guess_digit|
          p code_string
          if code_string.include?(guess_digit)
            @remaining_codes.delete(code_string) 
            p "remove #{code_string}"
          end
        end
      end
        #for each number in guess 1 1 1 1 / 1 2 3 4
          #check all nums in remaining, remove from remaining if contains that num
        # p guess.chars.uniq
        # guess.chars.uniq.each do |guess_digit|
        #   if code_string.include?(guess_digit)
        #     @remaining_codes.delete(code_string) 
        #     p "remove #{code_string}"
        #     p @remaining_codes.include?(code_string)
        #     next
        #   end
        # end
          
          
          #if code_string includes guess_digit, remove the string and continue loop
    end
    @remaining_codes.each do |code_string|
      code = SecretCode.new(code_string)
      # p code
      # puts guess
      # puts feedback.downcase
      # puts code.feedback(guess).downcase
      #if feedback is 0r0w remove guesses that contain those numbers
      
      ##remove impossible guesses
      

      ##TODO change guess if know number appeared before

      #run guess against code and get feedback string
      #if feedback string does not match remove from remaining
      unless (feedback.downcase == code.feedback(guess).downcase)
        @remaining_codes.delete(code_string)
        #current code is just deleting half of the arrays every time
      end
    end
    puts @remaining_codes.length
    p @remaining_codes

    puts @remaining_codes.include?("1111")
    #run through all remaining codes and determine secret_code feedback for each one
    #if the feedback is different than the current, remove it from the list
    #
    #DOESNT PROPERLY GUESS CODE, LETS GO WITH A FOLLOW RULES APPROACH TOMORROW
  end

  def feedback(guess)
    p "DEBUG == Code: #{@code_str}" # TODO REMOVE DEBUG WHEN FINISHED
    @secret_code.feedback(guess)
  end 

  def code_match?(guess)
    @secret_code.match?(guess)
  end

  def reset
    @secret_code = SecretCode.new(@all_codes.sample)
    @code_str = @secret_code.code
    @remaining_codes = @all_codes.clone
  end
  private

  def gen_all_combinations
    allCodes = []
    [1, 2, 3, 4, 5, 6].repeated_permutation(4) {|arr| allCodes.push(arr.join(""))} #doesnt include duplicates
    # puts allCodes.include?("1111")
    allCodes
  end
  
end

CPU = CodeCreator.new()
#p CPU.feedback("1234")
#p CPU.change_code

#Code "1111"
# CPU.consider("2222", "0R0W")
# CPU.consider("1122", "2R0W")
# CPU.consider("3145", "1R0W")
# CPU.consider("1112", "3R0W")
# CPU.consider("6112", "2R0W")
# CPU.consider("1234", "1R0W")
# p CPU.remaining_codes
# CPU.consider("1264", "1R0W")
# puts CPU.guess_num
#guess = CPU.guess_num
#CPU.consider(guess, SecretCode.new(guess).feedback)

#CPU.consider("2222", "0R0W")
#CPU.consider("2222", "0R0W")