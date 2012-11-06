module Refinery
  module Investments
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Investments

      engine_name :refinery_investments

      initializer "register refinerycms_investments plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "investments"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.investments_admin_investments_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/investments/investment'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Investments)
      end
    end
  end
end
