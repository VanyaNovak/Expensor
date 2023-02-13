require 'rails_helper'

RSpec.describe "Expenses", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "POST #create" do
    context "with valid params" do
      let(:category) { create(:category) }
      let(:expense_params) { FactoryBot.attributes_for(:expense, category_id: category.id, user_id: user.id) }

      it "creates a new expense" do
        expect {
          post expenses_path, params: { expense: expense_params }
        }.to change(Expense, :count).by(1)
      end
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
