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
    @round = 1
    @player_one = Player.new('PLAYER ONE')
    @player_two = Player.new('PLAYER TWO')

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
      puts "\n#{@player_one.name}, your symbol is #{RED}#{@player_one.symbol}#{RESET}"
      puts "#{@player_two.name}, your symbol is #{BLUE}#{@player_two.symbol}#{RESET}"
    elsif @player_one.symbol == 'O'
      @player_two.symbol = 'X'
      puts "\n#{@player_one.name}, your symbol is #{BLUE}#{@player_one.symbol}#{RESET}"
      puts "#{@player_two.name}, your symbol is #{RED}#{@player_two.symbol}#{RESET}"
    end
  end

  def display_board
    @board.display
  end

  def play_game
    while @round <= 9
      current_player = choose_player
      @board.update(choose_position(current_player), current_player.symbol)

      @round += 1
      pp @round
    end
  end

  def choose_player
    @round.even? ? @player_two : @player_one
  end

  def choose_position(current_player)
    puts "\n#{'─' * 50}"
    puts "||#{current_player.name}|| Place your piece (row, then column)"
    puts "#{'─' * 50}"
    print 'ROW >> '
    row = gets.chomp.to_i
    print 'COLUMN >> '
    column = gets.chomp.to_i
    [row, column]
  end
end

game = Game.new
game.set_symbols
game.display_symbols
game.display_board
game.play_game
