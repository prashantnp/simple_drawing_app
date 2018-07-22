require "rails_helper"

RSpec.describe GridCellsHelper, type: :helper do
	before(:each) do
		@user = User.create_random_user
  	@grid_cell = GridCell.first
	end

	context 'when the cell is not colored yet' do
		it 'has no colored by info' do
			expect(helper.get_title(@grid_cell)).to eq('')
		end
	end

	context 'when the cell is colored' do
		context 'when the cell is colored by random user' do
			it 'has colored by info' do
				allow(helper).to receive(:random_user).and_return(@user)

				@grid_cell.update(
					color: '#000fff',
					last_colored_by: @user,
					last_colored_at: Time.now
				)

				expect(helper.get_title(@grid_cell)).to eq("You colored it less than a minute ago")
			end
		end

		context 'when the cell is not colored by random user' do
			it 'has colored by info' do
				allow(helper).to receive(:random_user).and_return(User.create_random_user)

				@grid_cell.update(
					color: '#000fff',
					last_colored_by: @user,
					last_colored_at: Time.now
				)

				expect(helper.get_title(@grid_cell)).to eq("#{@user.user_name} colored it less than a minute ago")
			end
		end
	end
end