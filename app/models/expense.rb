class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  monetize :price
end
