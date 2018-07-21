class GridCell < ActiveRecord::Base
	COLOR_REGEX = %r{\A#(?:[A-F0-9]{3}){1,2}\z}i
	validates :color, format: { with: COLOR_REGEX }, allow_nil: true
end