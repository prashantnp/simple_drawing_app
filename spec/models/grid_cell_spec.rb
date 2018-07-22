require 'rails_helper'

RSpec.describe GridCell, type: :model do
  describe "Creation" do
    it 'is invalid when color is not in hex format' do
      invalid_hex_colors = ['123', '#1234', '#12345g', '@123456', '', ' ']

      invalid_hex_colors.each do |invalid_hex_color|
        grid_cell = GridCell.new(color: invalid_hex_color)
        expect(grid_cell).to be_invalid
      end
    end

    it 'is valid when color is in hex format or nil' do
      valid_hex_colors = [nil, '#123456']

      valid_hex_colors.each do |valid_hex_color|
        grid_cell = GridCell.new(color: valid_hex_color)
        expect(grid_cell).to be_valid
      end
    end
  end
end