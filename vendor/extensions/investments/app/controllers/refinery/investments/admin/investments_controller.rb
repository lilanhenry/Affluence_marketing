module Refinery
  module Investments
    module Admin
      class InvestmentsController < ::Refinery::AdminController

        crudify :'refinery/investments/investment', :xhr_paging => true

      end
    end
  end
end
