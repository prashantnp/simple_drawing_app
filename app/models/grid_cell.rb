class GridCell < ActiveRecord::Base
	TOTAL_REQUIRED_GRID_CELLS = 400
	COLOR_REGEX = %r{\A#(?:[A-F0-9]{3}){1,2}\z}i

	validates :color, format: { with: COLOR_REGEX }, allow_nil: true

	belongs_to :last_colored_by, class_name: 'User'

	def GridCell.total_cells
		TOTAL_REQUIRED_GRID_CELLS
	end

	def update_color(color, colored_by)
		self.color           = color
		self.last_colored_by = colored_by
		self.last_colored_at = Time.now
		self.save
	end
end