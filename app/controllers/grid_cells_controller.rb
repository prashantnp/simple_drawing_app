class GridCellsController < ApplicationController
  def index
  	set_grid_cells
  end

  private

  def set_grid_cells
  	@grid_cells = GridCell.all
  end
end
