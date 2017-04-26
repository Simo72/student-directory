def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first names
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"
    ]
    puts "What cohort?"
    cohort = gets.chomp.capitalize
      if months.include? (cohort)
        puts "Favourite meal?"
        meal = gets.chomp.downcase
        # add the student hash to the array
        students << {name: name, cohort: cohort, food: meal}
        puts "Now we have #{students.count} students"
        #get another name from the user
        puts "New name?"
        name = gets.chomp.capitalize
      else
        puts "Cohort not found, please re_enter."
      end
  end
  # return the array of students
  students
end

# and print them
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end



def print(students)
  count = 1
  until count > students.count
    students.each_with_index.collect do |student, index|
      name = student[:name]
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort) - loves to eat #{student[:food]}".center(75)
      count += 1
  end
end
end


def print_footer(names)
  puts "-------------".center(75)
  puts "Overall, we have #{names.count} great students".center(75)
end
# nothing happens until we call the methods
students = input_students

print_header
print(students)
print_footer(students)
