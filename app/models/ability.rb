class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, User
    can :read, News

    can :create, News if user.contributor?
    can :manage, News if user.moderator?
    can :manage, :all if user.root?
  end
end
