class GridCellsController < ApplicationController
	before_action :set_grid_cell, only: [:update]

  def index
  	set_grid_cells
  end

  def update
  	unless @grid_cell.update_color(params[:color].to_s.strip, random_user)
  		flash.now[:error] = 'Invalid color'
		end			

		respond_to do |format|
			format.js
		end
  end

  def refresh
  	set_grid_cells
  end

  private

  def set_grid_cell
  	@grid_cell = GridCell.find_by(id: params[:id].to_i)

  	unless @grid_cell
  		respond_to do |format|
  			format.js do
  				flash.now[:error] = 'Invalid grid cell'
  				render 'common/notify.js.erb'
  			end
  		end
  	end
  end

  def set_grid_cells
  	@grid_cells = GridCell.includes(:last_colored_by)
  end
end
