require 'student-directory'

describe StudentDirectory do

	before :each do
		@dir = StudentDirectory.new
	end

	describe 'data structure'  do

		it 'the student directory can be stored in an array list' do
			expect(@dir.student_list).to eq Array.new
		end

	end

	describe 'adding students to the list' do

		it 'puts values related to one student in the list' do
			@dir.add_student("Federico", 'May', "federico@test.com", "1")
			expect(@dir.student_list[0].values).to eq ["Federico", 'May', "federico@test.com", "1"]
		end

		it 'puts values related to two students in the list' do
			@dir.add_student("Federico", 'May', "federico@test.com", "1")
			@dir.add_student("John", 'May', "john@test.com", "2")
			expect(@dir.count_students).to eq 2
		end

	end

end