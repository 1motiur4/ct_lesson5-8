class Card
  NUMBERS = %w[Ace King Queen Jack 10 9 8 7 6 5 4 3 2]
  SUITS = %w[Spades Hearts Clubs Diamonds]
  VALUES = (2..14).to_a.reverse

  VALUE_HASH = NUMBERS.zip(VALUES).to_h

  def initialize(number, suit)
    @number = number
    @suit = suit
  end

  def number
    @number
  end

  def suit
    @suit
  end

  def value
    return value_hash[number]
  end

  def print_card
    puts "#{number} of #{suit}"
  end
end

card1 = Card.new(5, "spades")
card1.print_card
card1.value
