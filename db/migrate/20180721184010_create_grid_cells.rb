class CreateGridCells < ActiveRecord::Migration
  def change
    create_table :grid_cells do |t|
    	t.string :color
      t.integer :last_colored_by_id
      t.datetime :last_colored_at

      t.timestamps null: false
    end
  end
end
