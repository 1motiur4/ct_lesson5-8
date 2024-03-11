stuff = ["abc", "def", "apple", "apple", "apple"]

more_stuff = ["123", "456", "789"]

def fruits_good(gibberish)
  gibberish.each do |fruit|
    puts "#{fruit} is good"
  end
end

def my_fruits_index(fruits_list, fruits_name)
  count = 0
  fruits_list.each do |fruit|
    if fruit == fruits_name
      return count
    end
    count += 1
  end
end

def fruits_index(fruits, fruit_name)
  count = 0
  fruits.each do |f|
    return count if f == fruit_name
    count = count + 1
  end
end

puts fruits_index(stuff, "apple")
