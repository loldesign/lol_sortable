module ActiveRecord
  module LolSortable
    extend ActiveSupport::Concern

    included do
      scope :prioritized, -> {order('priority ASC')}

      before_save :set_default_priority

      def set_default_priority
        self.priority = 3000 if self.priority == 0
      end
    end

    module ClassMethods
      def prioritize(list_ids)
        list_ids.each_with_index do |id, index|
          resource = self.find id
          resource.update_attribute(:priority, index + 1)
        end
      end
    end
  end
end