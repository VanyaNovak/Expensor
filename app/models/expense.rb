class Expense < ApplicationRecord
  include Filterable

  belongs_to :user
  belongs_to :category

  validates :description, length: { minimum: 2, maximum: 40}

  scope :filter_by_category_id, -> (category) { where category_id: category }

  monetize :price_cents
end
