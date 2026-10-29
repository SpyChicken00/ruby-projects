class Board
  attr_accessor :board # Remove? unnecessary now?

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def print_board
    puts "\n#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}\n- - - - -
          \n#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}\n- - - - -
          \n#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}\n"
  end

  def place_marker(location, marker)
    # locations - TL, TM, TR ; ML, MM, MR ; BL, BM, BR
    # marker x, o
    # check if location already has a marker
    return "Invalid Space! Try Again" unless location_valid?(location)

    case location
    when "TL" then @board[0][0] = marker
    when "TM" then @board[0][1] = marker
    when "TR" then @board[0][2] = marker
    when "ML" then @board[1][0] = marker
    when "MM" then @board[1][1] = marker
    when "MR" then @board[1][2] = marker
    when "BL" then @board[2][0] = marker
    when "BM" then @board[2][1] = marker
    when "BR" then @board[2][2] = marker
    end
  end

  # how to determine which player?
  def three_in_row?
    three_diagonal? || three_horizontal? || three_vertical?
  end

  private

  def location_valid?(location)
    case location
    when "TL" then @board[0][0] == " "
    when "TM" then @board[0][1] == " "
    when "TR" then @board[0][2] == " "
    when "ML" then @board[1][0] == " "
    when "MM" then @board[1][1] == " "
    when "MR" then @board[1][2] == " "
    when "BL" then @board[2][0] == " "
    when "BM" then @board[2][1] == " "
    when "BR" then @board[2][2] == " "
    end
  end

  def check_row?(index)
    return false unless @board[index][0] == @board[index][1]
    return false unless @board[index][1] == @board[index][2]

    true
  end

  def three_horizontal?
    check_row?(0) || check_row?(1) || check_row?(2)
  end

  def check_column?(index)
    return false unless @board[0][index] == @board[1][index]
    return false unless @board[1][index] == @board[2][index]

    true
  end

  def three_vertical?
    check_column?(0) || check_column?(1) || check_column?(2)
  end

  def three_diagonal?
    diagonal1? || diagonal2?
  end

  def diagonal1?
    # \
    return false unless @board[0][0] == @board[1][1]
    return false unless @board[1][1] == @board[2][2]

    true
  end

  def diagonal2?
    # /
    return false unless @board[0][2] == @board[1][1]
    return false unless @board[1][1] == @board[2][0]

    true
  end
end

game_board = Board.new
p game_board.board
game_board.place_marker("TL", "X")
# game_board.place_marker("TM", "X")
# game_board.place_marker("TR", "X")
game_board.place_marker("ML", "X")
# game_board.place_marker("BL", "X")
game_board.place_marker("BR", "O")
game_board.print_board
game_board.place_marker("MM", "X")
game_board.print_board
game_board.place_marker("MM", "O")
p game_board.board
game_board.print_board
puts game_board.three_in_row?
