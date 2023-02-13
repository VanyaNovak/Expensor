require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user' do
    subject { User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "somepass") }

    context "with valid attrs" do
      it "validates user" do
        expect(subject).to be_valid
      end
    end

    context "with invalid attrs" do
      subject { User.new(first_name: "", last_name: "", email: "", password: "somepass") }

      it "validates user" do
        expect(subject).not_to be_valid
      end
    end
  end
end
