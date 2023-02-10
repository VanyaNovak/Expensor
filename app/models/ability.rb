# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      return unless user.present?
      can :manage, Expense, user_id: user.id
      can :read, Expense
  end
end
