class CodeCreator # computer 
  attr_reader :codes, :code
  def initialize
    @codes = gen_all_combinations # list of all combinations of 123456 -> computer player needs this too
    @code = @codes.sample
  end

  private 


  def feedback
    # give feedback based on how close guess was to 
    
  end

  def gen_all_combinations
    allCodes = [1, 2, 3, 4, 5, 6]
    allCodes.combination(4)
  end
end