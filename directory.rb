@students = []

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
  when "1"
    puts "You chose 1"
    input_students
  when "2"
    puts "You chose 2"
    show_students
  when "9"
    puts "You chose 9"
    exit
  when "3"
    puts "You chose 3"
    save_students
  when "4"
    puts "You chose 4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def add_students_to_array
  @students << {name: $student_name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    $student_name = name
    add_students_to_array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter the name of the file you wish to save your data to"
  filename = gets.chomp
  file = File.open(filename, "w")
  File::open(filename, "w") do
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
#  file.close
end

def load_students(filename = "students.csv")
  puts "Enter the name of the file you wish to load"
  filename = gets.chomp
  file = File.open(filename, "r")
  File::open(filename, "r") do
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      $student_name = name
      add_students_to_array
    end
  end 
#   file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
# data = __FILE__
# puts File.read(data)
try_load_students
interactive_menu
