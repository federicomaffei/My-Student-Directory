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

	describe 'show students list' do
		it 'shows a pretty formatted list of students' do
			@dir.add_student('George', :May, 'try@try.com', '1234567891')
			output = "Student 1 is named George, attending the May cohort, with email address try@try.com and ID 1234567891"
			expect(STDOUT).to receive(:puts).with(output)
			@dir.show_added_students
		end
	end

	describe 'write students to csv' do

		it 'adds the student list to a file' do
			@dir.add_student("Federico", 'May', "federico@test.com", "1")
			@dir.add_student("John", 'May', "john@test.com", "2")
			@dir.write_to_csv("directory_test.csv")
			@dir.student_list.clear #clear list to check if csv loads the two elements
			@dir.load_csv("directory_test.csv")
			expect(@dir.student_list.length).to eq 2
		end

	end

end