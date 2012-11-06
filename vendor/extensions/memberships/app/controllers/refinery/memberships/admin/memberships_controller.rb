module Refinery
  module Memberships
    module Admin
      class MembershipsController < ::Refinery::AdminController

        crudify :'refinery/memberships/membership', :xhr_paging => true

      end
    end
  end
end
