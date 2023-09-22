class CompanyPolicy < BasePolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.manager? || user.regular?
        scope.where(user:)
      else
        scope.none
      end
    end
  end
end
