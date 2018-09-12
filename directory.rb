def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "enter hobby"
  hobby = gets.chomp
  while !name.empty? do
    students << {name: name, hobby: hobby, cohort: :november}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
    puts "enter hobby"
    hobby = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name].center(15)} hobby: #{student[:hobby].center(15)} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

# now I'll call the methods
students = input_students
print_header
print(students)
print_footer(students)
