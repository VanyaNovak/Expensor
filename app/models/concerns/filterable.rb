module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, user_id)
      results = self.where(user_id: user_id)

      filtering_params&.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end

      results
    end
  end
end