module Assertion
  def assert &block
    raise ArguementError unless block.call
  end
end

class Rover

  include Assertion
  attr_accessor :position, :plateau

  def initialize position, plateau
    @position = position
    @plateau = plateau
  end

  def navigate instructions
    instructions.split('').each { |command| execute(command) }
  end

  def report
    "#{position.x} #{position.y} #{position.orientation}"
  end

  private

  def execute command
    case command
    when "R"
      turn_right
    when "L"
      turn_left
    when "M"
      move
    end
  end

  def turn_right
    @position.turn_right
  end

  def turn_left
    @position.turn_left
  end

  def movement_possible?
    @plateau.within_border?(test_position)
  end

  def test_position
    test_position = @position.clone
    test_position.move
    test_position
  end

  def move
    assert { movement_possible? }
    @position.move
  end
end



