def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it into variable
  selection = gets.chomp
  # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end







def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first names
  name = gets.chop.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"
    ]
    puts "What cohort?"
    cohort = gets.chop.capitalize
      if months.include? (cohort)
        puts "Favourite meal?"
        meal = gets.chop.downcase
        # add the student hash to the array
        students << {name: name, cohort: cohort, food: meal}
        puts "Now we have #{students.count} students"
        #get another name from the user
        puts "New name?"
        name = gets.chop.capitalize
      else
        puts "Cohort not found, please re_enter."
      end
  end
  # return the array of students
  students
end

def print_by_cohort(students, cohort)
    names = []
    students.map do |student|
        if student[:cohort] == cohort
            names << student[:name]
        end
    end
    puts "The students in #{cohort.capitalize} cohort are: "
    if names == []
      puts "Currently no students in #{cohort.capitalize} cohort"
    else
      names.each_index { |i| puts "#{i+1}. #{names[i]}" }
    end
end



# and print them
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end



def print(students)
  count = 1
#  if count <= 1
#    puts "NO STUDENTS!".center(75)
#  else
  until count > students.count
    students.each_with_index.collect do |student, index|
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort) - loves to eat #{student[:food]}".center(75)
      count += 1
  end
#end
end
end


def print_footer(names)
  puts "-------------".center(75)
  if names.count > 1
    puts "Overall, we have #{names.count} great students".center(75)
  else
    puts "Overall, we have #{names.count} great student".center(75)
  end
end
# nothing happens until we call the methods

interactive_menu
# print_by_cohort(students, "May")
# p students
