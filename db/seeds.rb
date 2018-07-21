existing_grid_cell_count = GridCell.count
grid_cells_to_be_created = GridCell.total_cells - existing_grid_cell_count
grid_cells_to_be_created.times do
	GridCell.create
end