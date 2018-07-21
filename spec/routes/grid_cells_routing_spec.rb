require "rails_helper"

RSpec.describe "routes for Grid Cells", type: :routing do
  it "routes / to the grid_cells controller's index action" do
    expect(get("/")).to route_to("grid_cells#index")
  end
end