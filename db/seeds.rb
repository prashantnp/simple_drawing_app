TOTAL_GRID_CELL_COUNT = 400
existing_grid_cell_count = GridCell.count
grid_cells_to_be_created = TOTAL_GRID_CELL_COUNT - existing_grid_cell_count
grid_cells_to_be_created.times do
	GridCell.create
end