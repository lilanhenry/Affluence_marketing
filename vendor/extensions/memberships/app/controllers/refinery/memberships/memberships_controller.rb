module Refinery
  module Memberships
    class MembershipsController < ::ApplicationController

      before_filter :find_all_memberships
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @membership in the line below:
        present(@page)
      end

      def show
        @membership = Membership.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @membership in the line below:
        present(@page)
      end

    protected

      def find_all_memberships
        @memberships = Membership.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/memberships").first
      end

    end
  end
end
