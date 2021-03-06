class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, User
    can :read, News
    can :read, Tag
    can :manage, Follow

    if user.contributor?
      can :create, News
      can :create, Tag
    end

    if user.moderator?
      can :manage, Tag
      can :manage, News
    end

    if user.root?
      can :manage, :all
    end
  end
end
