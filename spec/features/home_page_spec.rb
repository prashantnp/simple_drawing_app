require 'rails_helper'

describe 'Home page' do
	before(:each) do
    User.destroy_all
  end

	it 'is reachable', js: true do
		visit root_path
		random_user = User.first
    expect(page).to have_css('a', text: 'Simple Drawing App')
    expect(page).to have_css('h3', text: 'Grid')
    expect(page).to have_css('h3', text: 'Color Pallet')
    expect(page).to have_content("Welcome #{random_user.user_name}")
    expect(page).to have_css('div.grid-cell', count: 400)
	end
end