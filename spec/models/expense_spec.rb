require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validate description length' do
    subject { Expense.new(description: Faker::Lorem.word, user: user, category: category) }

    let(:user) { create(:user) }
    let(:category) { create(:category) }

    context "with valid description" do
      it "validates description" do
        expect(subject).to be_valid
      end
    end

    context "with invalid description" do
      subject { Expense.new(description: "", user: user, category: category) }

      it "validates description" do
        expect(subject).not_to be_valid
      end
    end
  end
end
