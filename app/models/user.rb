class User < ApplicationRecord
  after_create :new_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :expenses, dependent: :destroy
  has_one :list

  private

  def new_list
    List.create(user_id: id)
  end
end
