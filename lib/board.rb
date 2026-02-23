# Constants
HORIZONTAL_DIVIDER = '─'.freeze
EMPTY_BLOCK = '║   ║'.freeze
GRID_SIDE_LENGTH = 15

# Board is a grid
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3) { EMPTY_BLOCK }}
  end

  def display
    grid = @grid.flatten

    puts "\n#{HORIZONTAL_DIVIDER * GRID_SIDE_LENGTH}"

    grid.each_with_index do |block, index|
      if [2, 5, 8].include?(index)
        puts block
        puts HORIZONTAL_DIVIDER * GRID_SIDE_LENGTH
        next
      end
      print block
    end
  end

  def update(position, symbol)
    @grid[position[0]][position[1]] = "║ #{symbol} ║"
    display
  end
end

board = Board.new
board.display
board.update([1, 2], "X")
