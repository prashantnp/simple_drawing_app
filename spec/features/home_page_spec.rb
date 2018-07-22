require 'rails_helper'

describe 'Home page' do
	it 'is reachable', js: true do
		visit root_path
		random_user = User.first
    expect(page).to have_css('a', text: 'Simple Drawing App')
    expect(page).to have_css('strong', text: 'Instructions')
    expect(page).to have_css('h3', text: 'Grid')
    expect(page).to have_css('h3', text: 'Color Pallet')
    expect(page).to have_content("Welcome #{random_user.user_name}")
    expect(page).to have_css('div.grid-cell', count: 400)
	end

	it 'has grid cells that can be colored', js: true do
		visit root_path
		grid_cell = GridCell.first
		expect(page).to have_css("div#grid-cell-#{grid_cell.id}")
		find("div#grid-cell-#{grid_cell.id}", match: :first).click
		expect(page).to have_content('Please select a color from colorpallet to color this square')
		click_button('Copy the Color')
		page.execute_script "window.scrollTo(0,0)"
		expect(page).to have_content('Copied! Click on a square to color it')
		find("div#grid-cell-#{grid_cell.id}", match: :first).click
		wait_for_ajax
		expect(grid_cell.reload.color).to be_present
		find("div#grid-cell-#{grid_cell.id}", match: :first).hover
		expect(page).to have_content('You colored it')
	end

	it 'has a refresh button which refreshes the grid', js: true do
		visit root_path
		click_link('Refresh Grid')
		wait_for_ajax
		expect(page).to have_content('Refreshed!')
	end
end