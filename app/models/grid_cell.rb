class GridCell < ActiveRecord::Base
	TOTAL_REQUIRED_GRID_CELLS = 400
	COLOR_REGEX = %r{\A#(?:[A-F0-9]{3}){1,2}\z}i
	validates :color, format: { with: COLOR_REGEX }, allow_nil: true

	def GridCell.total_cells
		TOTAL_REQUIRED_GRID_CELLS
	end
end