def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first names
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What country are you from?"
    country = gets.chomp.upcase
    puts "Favourite meal?"
    meal = gets.chomp.downcase
    # add the student hash to the array
    students << {name: name, cohort: :november, country: country, food: meal}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "New name?"
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

# and print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end



def print(students)
  count = 1
  until count > students.count
    students.each_with_index.collect do |student, index|
      name = student[:name]
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort) - from #{student[:country]} and loves to eat #{student[:food]}}"
      count += 1
  end
end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods
students = input_students

print_header
print(students)
print_footer(students)
