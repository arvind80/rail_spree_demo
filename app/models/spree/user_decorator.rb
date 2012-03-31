class Spree::UserDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= Spree::User.new
    if user.has_role? 'read_only'
      can :read, :all
    end
  end

end

Spree::Ability.register_ability(Spree::UserDecorator)
