require 'rails_helper'

RSpec.describe GridCellsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(assigns(:grid_cells)).not_to be_nil
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "PUT #update" do
    it "renders update template" do
      put :update, id: 1, format: :js
      expect(response).to render_template(:update)
    end
  end

  describe "PATCH #update" do
    it "renders update template" do
      patch :update, id: 1, format: :js
      expect(response).to render_template(:update)
    end
  end
end
