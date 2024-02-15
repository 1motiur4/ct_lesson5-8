class Card
  def initialize(number, suit)
    @number = number
    @suit = suit
  end

  numbers = %w[Ace King Queen Jack 10 9 8 7 6 5 4 3 2]
  suits = %w[Spades Hearts Clubs Diamonds]
  values = (2..14).to_a.reverse

  value_hash = numbers.zip(values).to_h

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
