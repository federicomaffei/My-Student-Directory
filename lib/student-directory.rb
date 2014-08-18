require 'csv'

class StudentDirectory

	def student_list
		@students ||= []
	end

	def add_student(name, cohort, email, rg)
		student_list << {name: name, cohort: cohort, email: email, rg: rg}
	end

	def count_students
		count = student_list.length
	end

	def show_added_students
		@students.each_with_index do |student, index|
			puts "Student #{index+1} is named #{student[:name]}, attending the #{student[:cohort]} cohort, with email address #{student[:email]} and ID #{student[:rg]}"
		end
	end

	def write_to_csv(filename)
		CSV.open(filename, "w") do |csv|
			@students.each do |student|
				csv << [student[:name], student[:cohort], student[:email], student[:rg]]
			end
		end
	end

	def load_csv(filename)
		file = File.open(filename, "r")
		file.readlines.each do |line|
			name, cohort, email, rg = line.chomp.split(',')
			add_student(name, cohort, email, rg)
		end
		file.close
	end

	def delete_student(rg, filename)
		student_list.delete_if {|hash| hash[:rg] == rg}
		write_to_csv(filename)
	end

	def print_header
		puts "\n"+'Welcome to Makers Academy Student Directory:'
	end

	def print_footer
		puts "\n"+"Overall, we have #{count_students} students at Makers Academy."+"\n"
	end

	def interactive_menu 
		line1 = "1. Input a student in the directory"
		line2 = "2. Show the students in the directory"
		line3 = "3. Save the students to a csv file"
		line4 = "4. Load the student's list from csv file"
		line5 = "5. Delete a student from the directory"
		line6 = "9. Exit"
		puts "\n"+line1+"\n"+line2+"\n"+line3+"\n"+line4+"\n"+line5+"\n"+line6+"\n"
	end

end