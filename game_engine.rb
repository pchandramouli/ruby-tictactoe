require 'set'

class GameEngine
  attr_reader :positions

  def initialize
    init_positions
  end

  def init_positions
    @positions = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def positions
    @positions
  end

  def empty_positions?
    all_cells.each { |cell| return false if !cell.strip.empty? }
    true
  end

  def human_moves
    user_moves User::HUMAN_COIN
  end

  def computer_moves
    user_moves User::COMPUTER_COIN
  end

  def legal_move?(position)
    x, y = position_to_coords position
    positions[x][y].strip.empty?  ? true : false
  end

  def make_move(user, position)
    x, y = position_to_coords position

    if legal_move? position
      positions[x][y] = user.coin
      return true
    end
    false
  end

  def winning_positions
    wp = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]

    wp.collect { |p| p.to_set }
  end

  def wins?(user)
    position = user.is_a?(Human) ? human_moves : computer_moves
    winning_positions.each { |wp| return true if wp & position == wp }
    false
  end

  private

  def user_moves(coin)
    all_cells.each_with_index.map { |cell, i| i+1 if cell.strip == coin }.compact.to_set
  end

  def all_cells
    positions.flatten
  end

  def position_to_coords(position)
    return ((position - 1) / 3), ((position - 1) % 3)
  end

end
