class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :description
      t.integer :category_id
      t.integer :user_id
      t.monetize :price

      t.timestamps
    end
  end
end
