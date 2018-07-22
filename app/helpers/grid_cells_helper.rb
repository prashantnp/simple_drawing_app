module GridCellsHelper
	def get_title(grid_cell)
		if grid_cell.last_colored_by
			colored_user_name = grid_cell.last_colored_by == random_user ? 'You' : grid_cell.last_colored_by.user_name
			colored_at = grid_cell.last_colored_at
			"#{colored_user_name} colored it #{time_ago_in_words(colored_at)} ago"
		else
			''
		end
	end
end
