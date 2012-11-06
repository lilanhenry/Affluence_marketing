Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :investments do
    resources :investments, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :investments, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :investments, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
