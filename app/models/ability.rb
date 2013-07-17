class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      case user.role
        when 'student'
          can :read, @course
          can :sign_up, @course
       when 'teacher'
          can :read, @user
          can :update, @user
        when 'admin'
          can :manage, :all
      end

    # :read, :create, :update and :destroy.

    # can :update, Article, :published => true

  end
end
