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
	
end