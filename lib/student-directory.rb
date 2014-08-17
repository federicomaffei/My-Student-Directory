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

end