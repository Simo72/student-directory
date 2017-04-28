@students = []
def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing ( r read, w write, w+ read & write, a+ to append)
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end



def input_students
  puts "Please enter the name of the students"
  puts "Press enter to return to menu"
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
        # add the student hash to the array
        @students << {name: name, cohort: cohort}
        puts "Now we have #{@students.count} students"
        #get another name from the user
        puts "New name?"
        name = gets.chop.capitalize
      else
        puts "Cohort not found, please re_enter."
      end
  end
  # return the array of students
  #students
end

#def print_by_cohort(students, cohort)
#    names = []
#    students.map do |student|
#        if student[:cohort] == cohort
#            names << student[:name]
#        end
#    end
#    puts "The students in #{cohort.capitalize} cohort are: "
#    if names == []
#      puts "Currently no students in #{cohort.capitalize} cohort"
#    else
#      names.each_index { |i| puts "#{i+1}. #{names[i]}" }
#    end
#end



# and print them
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end



def print_students_list
  count = 1
#  if count <= 1
#    puts "NO STUDENTS!".center(75)
#  else
  until count > @students.count
    @students.each_with_index.collect do |student, index|
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)}".center(75)
      count += 1
  end
#end
end
end


def print_footer
  puts "-------------".center(75)
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(75)
  else
    puts "Overall, we have #{@students.count} great student".center(75)
  end
end
# nothing happens until we call the methods

interactive_menu
# print_by_cohort(students, "May")
# p students
