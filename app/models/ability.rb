class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, User
    if user.root?
      can :manage, :all
    end
  end
end
