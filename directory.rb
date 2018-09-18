@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.strip
  if name.empty?
    exit
  end
  puts "Enter their cohort"
  cohort = gets.strip
  if cohort.empty?
    cohort = "unknown"
  end
  while !name.empty? do
    @students << {name: name,cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.strip
    puts "Enter thier cohort"
    cohort = gets.strip.to_sym
    if cohort.empty?
      cohort = "unknown"
    end
  end
  @students
end

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
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
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
  count = 0
  until count == @students.count
    puts "#{@students[count][:name]} (#{@students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

# now I'll call the method
interactive_menu
