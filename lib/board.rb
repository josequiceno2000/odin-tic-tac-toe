# Board is a grid
class Board
  HORIZONTAL_DIVIDER = '─'.freeze
  EMPTY_BLOCK = '║   ║'.freeze
  GRID_SIDE_LENGTH = 15
  RED = "\e[31m".freeze
  BLUE = "\e[34m".freeze
  BOLD = "\e[1m".freeze
  RESET = "\e[0m".freeze

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
    row = position[0] - 1
    column = position[1] - 1
    if symbol == 'X'
      @grid[row][column] = "║#{RED} #{symbol} #{RESET}║"
    elsif symbol == 'O'
      @grid[row][column] = "║#{BLUE} #{symbol} #{RESET}║"
    end
    display
  end
end
