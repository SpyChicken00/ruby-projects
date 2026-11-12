require_relative "secret_code"
class CodeCreator < Player

  def initialize
    @all_codes = gen_all_combinations
    change_code
  end

  def feedback(guess)
    p "DEBUG == Code: #{@code_str}" #Guess: #{guess}"
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