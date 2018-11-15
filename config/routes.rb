Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: [] do
        collection do
          get :get_all_makes
          get 'get_models_for_make_id/:make_id', action: :get_models_for_make_id
          get 'get_models_for_make_id/:make_id/make_year/:make_year', action: :get_models_for_make_id_year
        end
      end
    end
  end
end
