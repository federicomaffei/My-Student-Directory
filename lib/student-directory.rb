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

end