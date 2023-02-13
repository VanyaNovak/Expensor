require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validate title' do
    subject { Category.new(title: Faker::Lorem.word) }

    context "with valid title" do
      it "validates title" do
        expect(subject).to be_valid
      end
    end

    context "with invalid title" do
      subject { Category.new(title: "") }

      it "validates title" do
        expect(subject).not_to be_valid
      end
    end
  end
end
