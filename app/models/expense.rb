class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :description, length: { minimum: 2, maximum: 40}

  monetize :price_cents
end
