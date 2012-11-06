module Refinery
  module Investments
    class InvestmentsController < ::ApplicationController

      before_filter :find_all_investments
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @investment in the line below:
        present(@page)
      end

      def show
        @investment = Investment.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @investment in the line below:
        present(@page)
      end

    protected

      def find_all_investments
        @investments = Investment.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/investments").first
      end

    end
  end
end
