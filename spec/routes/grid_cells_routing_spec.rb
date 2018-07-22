require "rails_helper"

RSpec.describe "routes for Grid Cells", type: :routing do
  it "routes / to grid_cells#index" do
    expect(get("/")).to route_to("grid_cells#index")
  end

  it "routes /grid_cells/:id via PATCH to grid_cells#update" do
    expect(patch("/grid_cells/1")).to route_to('grid_cells#update', id: '1')
  end

  it "routes /grid_cells/:id via PUT to grid_cells#update" do
    expect(put("/grid_cells/1")).to route_to('grid_cells#update', id: '1')
  end
end