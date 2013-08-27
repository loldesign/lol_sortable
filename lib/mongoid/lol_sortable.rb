module Mongoid
  module LolSortable
    extend ActiveSupport::Concern

    included do
      field :priority, type: Integer, default: 30000

      scope :prioritized, order_by(:priority.asc)
    end
    
    module ClassMethods
      def prioritize(list_ids)
        list_ids.each_with_index do |id, index|
          resource = self.find id
          resource.update_attribute(:priority, index)
        end
      end
    end
  end
end