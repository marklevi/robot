require_relative './lib/plateau.rb'
require_relative './lib/rover.rb'
require_relative './lib/position.rb'

class MarsRoverApp
  def self.run! file
    i = File.open(file)
    o = File.open("output.txt", 'w')
    plateau_dimension = i.readline
    plateau = Plateau.new(plateau_dimension)
    until i.eof?
      initial_position = i.readline
      position = Position.new(initial_position)
      instructions = i.readline.chomp
      rover = Rover.new(position, plateau)
      rover.navigate(instructions)
      o.write "#{rover.report}\n"
    end
    i.close
    o.close
  end
end


argv = ARGV[0] || "input.txt"

MarsRoverApp.run!(argv)



