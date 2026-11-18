require_relative "secret_code"
class CodeCreator < Player

  def initialize
    super("Computer")
    @all_codes = gen_all_combinations
    reset
  end

  def guess_num
    @remaining_codes.sample #TEST TODO FLESH OUT LOGIC
    #Rename class and adjust names accordingly
    #computer will take in a string from the user like 0r2w
    #first num is num of correct nums, 2nd means one of the numbers is correct
    #need a way to track numbers already guessed, look at algorithms page one more time to make the 
    #computer follow the rules of the game
    #
    # if (turn_num == 1) #turn 1
    #   turn_num += 1
    #   return "1111"
    # end
  end

  def consider(guess, feedback)
    # red = feedback.chars[0]
    # white = feedback.chars[2]
    puts @remaining_codes.length
    @remaining_codes.each do |code_string|
      code = SecretCode.new(code_string)
      #run guess against code and get feedback string
      #if feedback string does not match remove from remaining
      unless (feedback == code.feedback(guess))
        @remaining_codes.delete(code_string)
        #current code is just deleting half of the arrays every time
      end
    end
    puts @remaining_codes.length
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

# CPU = CodeCreator.new()
# p CPU.feedback("1234")
# p CPU.change_code