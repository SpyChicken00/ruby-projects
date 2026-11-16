require_relative "secret_code"
class CodeCreator < Player

  def initialize
    super("Computer")
    @all_codes = gen_all_combinations
    change_code
  end

  def guess_num
    @all_codes.sample #TEST TODO FLESH OUT LOGIC
    #Rename class and adjust names accordingly
    #computer will take in a string from the user like 0r2w
    #first num is num of correct nums, 2nd means one of the numbers is correct
    #need a way to track numbers already guessed, look at algorithms page one more time to make the 
    #computer follow the rules of the game
  end

  def feedback(guess)
    p "DEBUG == Code: #{@code_str}" # TODO REMOVE DEBUG WHEN FINISHED
    @secret_code.feedback(guess)
  end 

  def code_match?(guess)
    @secret_code.match?(guess)
  end

  def change_code
    @secret_code = SecretCode.new(@all_codes.sample)
    @code_str = @secret_code.code
  end
  private

  def gen_all_combinations
    allCodes = []
    [1, 2, 3, 4, 5, 6].permutation(4) {|arr| allCodes.push(arr.join(""))}
    allCodes
  end
  
end

# CPU = CodeCreator.new()
# p CPU.feedback("1234")
# p CPU.change_code