Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :memberships do
    resources :memberships, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :memberships, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :memberships, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
