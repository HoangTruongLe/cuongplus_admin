class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.super_user?
      permissions_for_super_users
    else
      permissions_for_normal_users
    end
  end

  def permissions_for_super_users
    can :manage, User
    can :manage, DashboardMessage
    can :manage, ProductType
    can :manage, Product
  end

  def permissions_for_normal_users
    can :read, DashboardMessage
  end

end
