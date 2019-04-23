class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Article, user_id: user.id
  end
end