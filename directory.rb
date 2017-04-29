@students = []
@name = ""
@cohort = ""


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"  then input_students
    when "2"  then show_students
    when "3"  then save_students
      puts "**NEW STUDENTS SAVED**".center(75)
    when "4"  then load_students
      puts "**STUDENTS UPLOADED**".center(75)
    when "9"  then exit
    else
      puts "I don't know what you mean, try again"
    end
  end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  puts "Please input filename?"
  save_file = gets.chomp
  # open the file for writing ( r read, w write, w+ read & write, a+ to append)
  file = File.open(save_file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def student_to_hash
  @students << {name: @name, cohort: @cohort}
end


def load_students
  puts "Please enter filename."
  file_load = gets.chomp
  file = File.open(file_load, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
      student_to_hash
    end
    file.close
  end

# CALL load_students AND NO NEED FOR BELOW METHOD
#  def first_load_students
#    filename = ARGV.first #first argument from command line
#    return if filename.nil? #get out of the method if it isn't given
#    if File.exists?(filename)
#      load_students(filename)
#        puts "Loaded #{@students.count} students from #{filename}"
#    else #if it doesn't exists
#      puts "Sorry, #{filename} doesn't exist."
#      exit #quit the program
#    end
#  end

def input_students
  puts "Please enter the name of the students"
  puts "Press enter to return to menu"
  #get the first names
  @name = STDIN.gets.chop
  # while the name is not empty, repeat this code
  while !@name.empty? do
    months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"
    ]
    puts "What cohort?"
    @cohort = STDIN.gets.chop.capitalize
      if months.include? (@cohort)
        # add the student hash to the array
        student_to_hash
        puts "Now we have #{@students.count} students"
        #get another name from the user
        puts "New name?"
        @name = STDIN.gets.chop
      else
        puts "Cohort not found, please re_enter."
      end
  end
  # return the array of students
  #students
end


# and print them
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end



def print_students_list
  count = 1
  until count > @students.count
    @students.each_with_index.collect do |student, index|
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)".center(75)
      count += 1
    end
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
load_students
interactive_menu
