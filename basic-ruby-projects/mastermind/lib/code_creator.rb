require_relative "secret_code"
class CodeCreator 
  # list of all combinations of 123456 -> computer player needs this too
  ALL_CODES = gen_all_combinations

  ##@@trying to make const or static so it doesnt get called more than needd to 

  attr_reader :code
  def initialize
    @code = SecretCode.new(ALL_CODES.sample)
  end

  # private 


  def feedback
    code.feedback()
  end

  def gen_all_combinations
    allCodes = []
    # [1, 2, 3, 4, 5, 6].permutation(4).to_a.each{|arr| allCodes.push(arr.join(""))}
    [1, 2, 3, 4, 5, 6].permutation(4) {|arr| allCodes.push(arr.join(""))}
    allCodes
    #array.join
  end
end

CPU = CodeCreator.new()
p CPU.code