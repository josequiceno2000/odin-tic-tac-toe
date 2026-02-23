# Constants
HORIZONTAL_BORDER = '═'
HORIZONTAL_DIVIDER = '─'
VERTICAL_BORDER = '║'
VERTICAL_DIVIDER = '│'
EMPTY_BLOCK = '║ ║'
GRID_HEIGHT = 9
GRID_LENGTH = 9

# Board is a grid 
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3) { EMPTY_BLOCK }}
    @block_count = 0
  end

  def display
    grid = @grid.flatten
    puts "\n#{HORIZONTAL_BORDER * GRID_LENGTH}"

    grid.each_with_index do |block, index|
      if index == 8
        puts block
        puts HORIZONTAL_BORDER * GRID_LENGTH
      elsif [2, 5].include?(index)
        puts block
        puts HORIZONTAL_DIVIDER * GRID_HEIGHT
        @block_count = 0
        next
      end
      print block
      @block_count += 1
    end
  end


  def update(position, symbol)
    
  end
end

board = Board.new
board.display