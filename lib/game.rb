require_relative 'board'
require_relative 'player'

# Game contains all game logic
class Game
  TITLE = <<~TEXT.freeze
    ▄▄▄▄▄▪   ▄▄·     ▄▄▄▄▄ ▄▄▄·  ▄▄·     ▄▄▄▄▄      ▄▄▄ .
    •██  ██ ▐█ ▌▪    •██  ▐█ ▀█ ▐█ ▌▪    •██  ▪     ▀▄.▀·
     ▐█.▪▐█·██ ▄▄     ▐█.▪▄█▀▀█ ██ ▄▄     ▐█.▪ ▄█▀▄ ▐▀▀▪▄
     ▐█▌·▐█▌▐███▌     ▐█▌·▐█ ▪▐▌▐███▌     ▐█▌·▐█▌.▐▌▐█▄▄▌
     ▀▀▀ ▀▀▀·▀▀▀      ▀▀▀  ▀  ▀ ·▀▀▀      ▀▀▀  ▀█▄▀▪ ▀▀▀ 
  TEXT

  WELCOME = "\nWelcome to Tic Tac Toe.".freeze
  RED = "\e[31m".freeze
  BLUE = "\e[34m".freeze
  BOLD = "\e[1m".freeze
  RESET = "\e[0m".freeze

  def initialize
    @board = Board.new
    @player_one = Player.new
    @player_two = Player.new

    puts TITLE
    puts WELCOME
  end

  def set_symbols
    puts "\n#{'─' * 44}"
    print "||PLAYER ONE|| choose your symbol 'X' or 'O'\n#{'─' * 44}\n>> "
    @player_one.symbol = gets.chomp.upcase
  end

  def display_symbols
    if @player_one.symbol == 'X'
      @player_two.symbol = 'O'
      puts "\nPLAYER ONE, your symbol is #{RED}#{@player_one.symbol}#{RESET}"
      puts "PLAYER TWO, your symbol is #{BLUE}#{@player_two.symbol}#{RESET}"
    elsif @player_one.symbol == 'O'
      @player_two.symbol = 'X'
      puts "\nPLAYER ONE, your symbol is #{BLUE}#{@player_one.symbol}#{RESET}"
      puts "PLAYER TWO, your symbol is #{RED}#{@player_two.symbol}#{RESET}"
    end
  end

  def display_board
    @board.display
  end
end

game = Game.new
game.set_symbols
game.display_symbols
game.display_board
