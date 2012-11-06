module Refinery
  module Investments
    class Investment < Refinery::Core::BaseModel
      self.table_name = 'refinery_investments'

      attr_accessible :title, :content, :position

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
