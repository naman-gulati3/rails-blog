class Ability
  include CanCan::Ability
  def initialize( user )

    user ||= User.new
can :manage, :all
    # Define User abilities
  end
end     