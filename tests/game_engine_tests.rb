require 'minitest/autorun'
require './game_engine'
require './user'
require './human'
require './computer'

class GameEngineTests < Minitest::Test

  def setup
    @ge = GameEngine.new
  end

  def test_empty_board
    assert @ge.empty_positions?
  end

  def test_legal_move
    assert @ge.legal_move? 1
  end

  def test_illegal_move
    @ge.make_move Human.new(@ge), 3
    refute @ge.legal_move? 3
  end

  def test_win
    h = Human.new @ge
    h.make_move 1
    h.make_move 4
    h.make_move 7
    assert @ge.wins? h
  end

  def test_not_win
    h = Human.new @ge
    h.make_move 1
    h.make_move 3
    h.make_move 4

    refute @ge.wins? h
  end

end
