require "colorize"
require "colorized_string"

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    set_up_pieces
  end

  def display
    @board.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        background = :white if (i + j).even?
        background = :black if (i + j).odd?

        print "   ".colorize(background: background) if spot.nil?
        print spot.display.colorize(background: background) unless spot.nil?
      end
      puts
    end
  end

  #"13" will be the coordinate for row 1, col 3
  def set_piece(piece, coordinate)
    row, column = coordinate.chars.map(&:to_i)
    @board[row][column] = piece
  end

  def set_up_pieces
    (10..17).each do |coord|
      set_piece(Pawn.new("black"), coord.to_s)
    end

    set_piece(Rook.new("black"), "00")
    set_piece(Rook.new("black"), "07")

    (60..67).each do |coord|
      set_piece(Pawn.new("white"), coord.to_s)
    end
    set_piece(Rook.new("white"), "70")
    set_piece(Rook.new("white"), "77")
  end

  def move_piece(start_coord, end_coord, whites_turn)
    start_row, start_column = start_coord.chars.map(&:to_i)
    end_row, end_column = end_coord.chars.map(&:to_i)

    piece = @board[start_row][start_column]

    return false if piece.nil?
    return false if piece.color == "black" && whites_turn
    return false if piece.color == "white" && !whites_turn
    return false unless piece.valid_move?(start_coord, end_coord)

    @board[start_row][start_column] = nil
    @board[end_row][end_column] = piece
  end

  class Pawn
    def initialize(color)
      @color = color
    end

    def display
      return " \u265F ".colorize(color: :light_white) if @color == "white"
      return " \u265F ".colorize(color: :light_black) if @color == "black"
    end

    def valid_move?(from, to)
      direction = @color == "white" ? -1 : 1
      from_row, from_column = from.chars.map(&:to_i)
      to_row, to_column = to.chars.map(&:to_i)

      return true if from_row + direction == to_row && from_column == to_column

      false
    end

    def color
      @color
    end
  end

  class Rook
    def initialize(color)
      @color = color
    end

    def display
      return " \u265C ".colorize(color: :light_white) if @color == "white"
      return " \u265C ".colorize(color: :light_black) if @color == "black"
    end

    def color
      @color
    end
  end
end

class ChessGame
  def initialize
    @board = Board.new
    @whites_turn = true
  end

  def play
    loop do
      @board.display
      puts "Turn: White" if @whites_turn
      puts "Turn: Black" unless @whites_turn
      puts "Which piece would you like to move?"
      start_coord = gets.chomp

      puts "Where would you like to move this piece?"
      end_coord = gets.chomp

      moved = @board.move_piece(start_coord, end_coord, @whites_turn)

      puts "INVALID MOVE! Try again" unless moved
      next unless moved

      @whites_turn = !@whites_turn
    end
  end
end

game = ChessGame.new
game.play
