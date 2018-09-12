def input_students
  students = []
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
    students << {name: name,cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.strip
    puts "Enter thier cohort"
    cohort = gets.strip.to_sym
    if cohort.empty?
      cohort = "unknown"
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  until count == students.count
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
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
