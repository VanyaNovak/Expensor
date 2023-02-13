require 'rails_helper'

RSpec.describe "Lists", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before do
    sign_in user
  end

  describe "GET #show" do
    let(:first_category) { create(:category) }
    let(:second_category) { create(:category) }

    let!(:expenses_with_first_category) { create_list(:expense, 3, category: first_category, user: user) }
    let!(:expenses_with_second_category) { create_list(:expense, 3, category: second_category, user: user) }

    context "without filters" do
      it "returns all expenses related to user" do
        get list_path(user.list)

        expect(response.status).to eq 200
        expect(assigns["expenses"]).to match_array expenses_with_first_category + expenses_with_second_category
      end
    end

    context "with filters, get expenses by first category" do
      it "returns filtered expenses related to user" do
        get list_path(user.list), params: { filters: { category_id: first_category.id } }

        expect(response.status).to eq 200
        expect(assigns["expenses"]).to match_array expenses_with_first_category
      end
    end
  end
end