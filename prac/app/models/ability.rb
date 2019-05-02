class Ability
  include CanCan::Ability
  def initialize( user )

    user ||= User.new
can :read, Article
can :read, Comment
    # Define User abilities
  end
end     