require "rails_helper"

RSpec.describe "routes for Grid Cells", type: :routing do
  it "routes / to the grid_cells controller's index action" do
    expect(get("/")).to route_to("grid_cells#index")
  end

  it "routes /grid_cells/:id to the grid_cells controller's update action" do
    expect(patch("/grid_cells/1")).to route_to('grid_cells#update', id: '1')
  end
end