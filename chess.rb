require "colorize"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def display
    @board.each do |row|
      row.each do |spot|
        print "    ".colorize(background: :white)
      end
      puts
    end
  end
end

b = Board.new
b.display
