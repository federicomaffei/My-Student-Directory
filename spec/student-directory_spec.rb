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

	describe 'delete students' do
		it 'deletes a student from the list' do
			@dir.add_student("Federico", 'May', "federico@test.com", "1")
			@dir.add_student("John", 'May', "john@test.com", "2")	
			@dir.delete_student('1', "directory_test.csv")
			expect(@dir.student_list.length).to eq 1
		end

		it 'deletes a student from the csv file' do
			@dir.load_csv("directory_test.csv")
			@dir.delete_student('1', "directory_test.csv")
			expect(@dir.student_list.length).to eq 1
		end
	end

	describe 'interactive menu' do
		context "first iteration" do
			it 'prints a header to begin the output' do
				expect(STDOUT).to receive(:puts).with("\n"+'Welcome to Makers Academy Student Directory:')
				@dir.print_header
			end

			it 'prints a footer to end the output' do
				expect(STDOUT).to receive(:puts).with("\n"+"Overall, we have 0 students at Makers Academy."+"\n")
				@dir.print_footer
			end

			it 'prints to screen a menu for the user to choose from' do
				line1 = "1. Input a student in the directory"
				line2 = "2. Show the students in the directory"
				line3 = "3. Save the students to a csv file"
				line4 = "4. Load the student's list from csv file"
				line5 = "5. Delete a student from the directory"
				line6 = "9. Exit"
				output = "\n"+line1+"\n"+line2+"\n"+line3+"\n"+line4+"\n"+line5+"\n"+line6+"\n"
				expect(STDOUT).to receive(:puts).with(output)
				@dir.interactive_menu
			end
		end

		context 'user choice handling' do
			it 'allows the user to input a student if 1 is entered' do
				expect(STDOUT).to receive(:puts).with("Please enter the name, cohort, email and ID of the student, separated by comma")
				expect(STDIN).to receive(:gets).and_return("Federico,May,test@test.com,1")
				expect(STDOUT).to receive(:puts).with("Now we have 1 students")
				@dir.user_choice("1")
				expect(@dir.student_list[0][:name]).to eq 'Federico'
				expect(@dir.student_list[0][:cohort]).to eq 'May'
				expect(@dir.student_list[0][:email]).to eq 'test@test.com'
				expect(@dir.student_list[0][:rg]).to eq '1'
			end

			it 'allows the user to see the student list if 2 is entered' do
				expect(STDOUT).to receive(:puts).with("Please enter the name, cohort, email and ID of the student, separated by comma")
				expect(STDIN).to receive(:gets).and_return("Federico,May,test@test.com,1")
				expect(STDOUT).to receive(:puts).with("Now we have 1 students")
				@dir.user_choice("1")
				expect(STDOUT).to receive(:puts).with("Student 1 is named Federico, attending the May cohort, with email address test@test.com and ID 1")
				@dir.user_choice("2")
			end

			it 'allows the user to save the student list to csv if 3 is entered and load from that file if 4 is entered' do
				expect(STDOUT).to receive(:puts).with("Please enter the name, cohort, email and ID of the student, separated by comma")
				expect(STDIN).to receive(:gets).and_return("Federico,May,test@test.com,1")
				expect(STDOUT).to receive(:puts).with("Now we have 1 students")
				@dir.user_choice("1")
				@dir.user_choice("3")
				@dir.student_list.clear
				@dir.user_choice("4")
				expect(@dir.student_list.length).to eq 1
			end

			it 'allows the user to delete an added student if 5 is entered' do
				expect(STDOUT).to receive(:puts).with("Please enter the name, cohort, email and ID of the student, separated by comma")
				expect(STDIN).to receive(:gets).and_return("Federico,May,test@test.com,1")
				expect(STDOUT).to receive(:puts).with("Now we have 1 students")
				@dir.user_choice("1")
				expect(STDOUT).to receive(:puts).with("Please enter the ID of the student to delete:")
				expect(STDIN).to receive(:gets).and_return("1")
				@dir.user_choice("5")
				expect(@dir.student_list.length).to eq 0
			end
		end
	end
end