require 'rails_helper'

RSpec.describe "grid_cells/index.html.erb", type: :view do
  it "displays header" do
    render
    expect(rendered).to match /Simple Drawing App/
  end
end
