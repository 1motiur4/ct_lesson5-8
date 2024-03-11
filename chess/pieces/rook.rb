require_relative "piece"

class Rook < Piece
  def picture
    "\u265C"
  end

  def valid_move?(to)
    return false unless super

    from_row, from_column = position
    to_row, to_column = to

    return false unless from_row == to_row || from_column == to_column

    true
  end
end
