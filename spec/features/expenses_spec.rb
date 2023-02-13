require 'rails_helper'

RSpec.feature "Expenses", type: :feature do
  let(:user) { create(:user) }
  let!(:category) { create(:category) }

  before do
    sign_in user
  end

  describe "create" do
    it "creates new expense" do
      visit expenses_path
      click_on("Add")

      expect(page.current_url).to eq new_expense_url

      fill_in "Description", with: "Title"
      find(:select).find(:option, category.title).select_option
      fill_in "Price", with: 100

      click_on "Add"

      expect(Expense.count).to eq 1
      expect(Expense.last.description).to eq "Title"
      expect(Expense.last.category).to eq category
    end
  end

  describe "edit" do
    let!(:expense) { create(:expense, category: category, user: user) }
    let!(:second_category) { create(:category) }

    it "creates new expense" do
      visit expenses_path
      click_on("Edit")

      expect(page.current_url).to eq edit_expense_url(expense)

      fill_in "Description", with: "New Title"
      find(:select).find(:option, second_category.title).select_option

      click_on "Update"

      expect(Expense.last.description).to eq "New Title"
      expect(Expense.last.category).to eq second_category
    end
  end
end
