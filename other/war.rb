def build_deck
  # numbers = %w[Ace King Queen Jack 10 9 8 7 6 5 4 3 2]
  numbers = %w[6 5 4 3 2]
  suits = %w[Spades Hearts Clubs Diamonds]
  values = (2..6).to_a.reverse

  value_hash = numbers.zip(values).to_h

  deck = []
  suits.each do |suit|
    numbers.each do |number|
      deck << {
        "name" => "#{number} of #{suit}",
        "value" => value_hash[number],
      }
    end
  end
  deck.shuffle
end

def run_game
  deck = build_deck

  player = deck[0..9]
  computer = deck[10..19]

  until computer.empty? || player.empty?
    play_round(player, computer)
  end

  return puts "YOU WIN" if computer.empty?
  return puts "YOU LOSE" if player.empty?
end

def play_round(player, computer)
  p "press enter to play your card"
  gets

  card_1 = player.delete_at(0)
  card_2 = computer.delete_at(0)

  middle = []
  middle << card_1
  middle << card_2

  play_war(middle, player, computer)
  p ">> You have #{player.length} card(s) left"
  p ">> Computer has #{computer.length} card(s) left"
end

def play_war(middle, player, computer)
  card_1 = middle[-2]
  card_2 = middle[-1]
  puts "your card is #{card_1["name"]}"
  puts "computer's card is #{card_2["name"]}"

  if card_1["value"] > card_2["value"]
    puts "You win the round"
    puts "\n"
    return player.concat(middle)
  elsif card_2["value"] > card_1["value"]
    puts "Computer wins the round"
    puts "\n"
    return computer.concat(middle)
  else
    puts "========================================================I DECLARE WAR========================================================"

    4.times do
      middle << player.delete_at(0)
      middle << computer.delete_at(0)
    end

    play_war(middle, player, computer)
  end
end

run_game
