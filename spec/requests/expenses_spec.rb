require 'rails_helper'

RSpec.describe "Expenses", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    sign_in user
  end

  describe "POST #create" do
    context "with valid params" do
      let(:expense_params) { FactoryBot.attributes_for(:expense, category_id: category.id, user_id: user.id) }

      it "creates a new expense" do
        expect {
          post expenses_path, params: { expense: expense_params }
        }.to change(Expense, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:expense_params) { FactoryBot.attributes_for(:expense) }

      it "creates a new expense" do
        expect {
          post expenses_path, params: { expense: expense_params }
        }.to change(Expense, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    let!(:expense) { create(:expense, user: user, category: category) }
    let(:new_category) { create(:category) }
    let(:update_params) do
      {
        id: expense.id,
        description: "new description",
        category_id: new_category.id
      }
    end

    it "updates an expense" do
      put expense_path(expense), params: { expense: update_params }

      expect(response).to redirect_to list_path(user.list)

      expense.reload
      expect(expense.description).to eq update_params[:description]
      expect(expense.category).to eq new_category
    end
  end

  describe "DELETE #destroy" do
    let!(:expense) { create(:expense, user: user, category: category) }

    it "destroys a new expense" do
      expect {
        delete expense_path(expense)
      }.to change(Expense, :count).by(-1)
    end
  end
end
