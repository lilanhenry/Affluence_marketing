module Refinery
  module Memberships
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Memberships

      engine_name :refinery_memberships

      initializer "register refinerycms_memberships plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "memberships"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.memberships_admin_memberships_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/memberships/membership'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Memberships)
      end
    end
  end
end
