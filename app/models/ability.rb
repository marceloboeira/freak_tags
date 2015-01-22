class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= current_user

    can :read, User
    if user.root?
      can :manage, :all
    end
  end
end
