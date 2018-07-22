Rails.application.routes.draw do
  root 'grid_cells#index'

  resources :grid_cells, only: [:update] do
  	collection do
      get 'refresh'
    end
  end
end
