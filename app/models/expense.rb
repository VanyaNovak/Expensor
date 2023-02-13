class Expense < ApplicationRecord
  include Filterable

  belongs_to :user
  belongs_to :category

  validates :description, length: { minimum: 2, maximum: 40 }

  scope :by_asc, -> { order(price_cents: :asc) }
  scope :by_desc, -> { order(price_cents: :desc) }
  scope :filter_by_category_id, -> (category) { where category_id: category }
  scope :filter_by_price, -> (order) { send("#{order}") }

  monetize :price_cents
end
