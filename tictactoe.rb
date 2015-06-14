require './board'
require './game_engine'
require './human'
require './computer'

class TicTacToe
  def initialize
    @game_engine = GameEngine.new
    @board = Board.new(@game_engine)
    @human = Human.new(@game_engine)
    @computer = Computer.new(@game_engine)
  end

  def redraw_board
    puts board.redraw
  end

  def board
    @board
  end

  def human
    @human
  end

  def computer
    @computer
  end

  def play
    redraw_board
    puts 'Hey dude, what\'s your name? '
    name = gets.chomp

    puts "Your move, #{name}? "
    pos = gets.chomp.to_i

    while pos != -1
      if human.make_move(pos)
	redraw_board
	if human.wins?
	  puts "You win #{name}, I lose!"
	  exit
	end
      else
	puts "Invalid move, #{name}! Please try again.\nYour move, #{name}? "
	pos = gets.chomp.to_i
	next
      end

      puts 'My move: '
      if computer.make_move
	redraw_board
	if computer.wins?
	  puts "I win, you lose #{name}!"
	  exit
	end
      end

      puts "Your move, #{name}? "
      pos = gets.chomp.to_i

    end
  end
end

t = TicTacToe.new
t.play
