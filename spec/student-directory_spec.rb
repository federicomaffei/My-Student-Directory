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

end