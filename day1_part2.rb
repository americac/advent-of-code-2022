#By the time you calculate the answer to the Elves' question, they've already realized that the Elf carrying the most Calories of food might eventually run out of snacks.
#
#To avoid this unacceptable situation, the Elves would instead like to know the total Calories carried by the top three Elves carrying the most Calories. That way, even if one of those Elves runs out of snacks, they still have two backups.
#
#In the example above, the top three Elves are the fourth Elf (with 24000 Calories), then the third Elf (with 11000 Calories), then the fifth Elf (with 10000 Calories). The sum of the Calories carried by these three elves is 45000.
#
#Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?

input_file = File.open("day_1_input.txt")
file_data = input_file.readlines.map(&:chomp)

calorie_sum = 0
most_calories = 0
calorie_holders = []

file_data.each do |calorie|
  if calorie.empty?
    calorie_holders << calorie_sum
    calorie_sum = 0
  else
    calorie_sum += calorie.to_i
  end
end

most_calories = calorie_holders.sort!.reverse!.take(3).sum
puts "Most calories: #{most_calories}"


