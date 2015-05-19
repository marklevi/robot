class Position
  attr_accessor :orientation, :x, :y

  COMPASS = %w(N E S W)

  def initialize position
    x_coor, y_coor, orientation = position.split
    @x = x_coor.to_i
    @y = y_coor.to_i
    @orientation = orientation
  end

  def turn_right
    index_of_right = (curr_index + 1) % 4
    @orientation = COMPASS[index_of_right]
  end

  def turn_left
    index_of_left = (curr_index - 1) % 4
    @orientation = COMPASS[index_of_left]
  end

  def move
    if north?
      @y += 1
    elsif east?
      @x += 1
    elsif south?
      @y -= 1
    elsif west?
      @x -= 1
    end
  end

  private

  def north?; @orientation == "N"; end
  def east? ; @orientation == "E"; end
  def south?; @orientation == "S"; end
  def west? ; @orientation == "W"; end

  def curr_index
    COMPASS.index(@orientation)
  end
end

