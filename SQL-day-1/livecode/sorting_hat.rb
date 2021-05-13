batch628 = [
  'Maruan', 'Antonius', 'Julian', 'Coline', 'Alen',
  'Joaquin', 'Johanna', 'Camillo', 'Marta', 'Lili'
]
hogwarts = {
  'Gryffindor🦁' => [],
  'Slytherin🐍' => [],
  'Hufflepuff🦡' => [],
  'Ravenclaw🦅' => []
}

puts 'Welcome to Hogwarts! I will sort students in four different houses:'

def display_houses(houses_hash)
  houses_hash.each do |house, array|
    puts "#{house} || #{array}"
  end
end

def new_random_house(houses_hash)
  random_house = houses_hash.keys.sample
  if houses_hash[random_house].length < 3
    random_house
  else
    new_random_house(houses_hash)
  end
end

until batch628.empty?
  display_houses(hogwarts)
  puts '--------------------------------'
  puts "Press enter when you're ready..."
  puts '--------------------------------'
  gets.chomp
  system('clear')
  puts 'and the next student is ...'
  sleep(1)
  puts '...'
  sleep(1)
  batch628 = batch628.shuffle
  student = batch628.pop
  puts
  puts '🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉'
  puts "       #{student}!!!"
  puts '🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉'

  puts "#{student}'s new house will beeeeee...."
  sleep(0.5)
  puts '🦁...'
  sleep(0.5)
  puts '🐍...'
  sleep(0.5)
  puts '🦡...'
  sleep(0.5)
  puts '🦅...'
  sleep(1.5)
  house = new_random_house(hogwarts)
  puts
  puts "#{house}!!!! #{house[-1]}Congratulations!!!#{house[-1]}"
  puts
  hogwarts[house] << student


  sleep(2.5)
  system('clear')
end

lonely_array = hogwarts.values.find { |arr| arr.length == 1 }
if lonely_array
  puts 'Wait a second....'
  puts 'I made a mistake!'
  sleep (2)
  lonely_student = lonely_array.first
  puts "#{lonely_student} actually belongs to another house."
  puts '--------------------------------'
  puts "Press enter when you're ready..."
  puts '--------------------------------'
  gets.chomp
  sleep(0.5)
  puts "#{lonely_student}'s new house will beeeeee...."
  sleep(0.5)
  puts '🦁...'
  sleep(0.5)
  puts '🐍...'
  sleep(0.5)
  puts '🦡...'
  sleep(0.5)
  puts '🦅...'
  sleep(1.5)
  lonely_house = hogwarts.key(lonely_array)
  house = (hogwarts.keys - [lonely_house]).sample
  puts
  puts "#{house}!!!! #{house[-1]}Congratulations!!!#{house[-1]}"
  puts
  hogwarts[house] << hogwarts[lonely_house].delete(lonely_student)
end
puts
display_houses(hogwarts)
puts
