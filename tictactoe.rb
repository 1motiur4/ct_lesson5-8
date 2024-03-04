class Board
  def initialize
    @matrix = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
    ]
  end

  def display
    @matrix.each do |row|
      p row
    end
    nil
  end

  def update(coordinates, mark)
    row = coordinates[1]
    column = coordinates[0]

    @matrix[row][column] = mark
  end

  def rows
    @matrix
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def play
    x_turn = true
    until winner
      puts "give coordinates for your tic tac toe move"
      puts "type '0, 0' for the top left corner"

      input = gets.chomp
      mark = "X" if x_turn
      mark = "O" unless x_turn

      coordinates = input.split(",").map(&:strip).map(&:to_i)

      @board.update(coordinates, mark)
      @board.display

      x_turn = !x_turn
    end
  end

  def winner
    @board.rows.each do |row|
      return row.first if row.uniq.count == 1 && !row.first.nil?
    end
    false
  end
end

game = Game.new
game.play
