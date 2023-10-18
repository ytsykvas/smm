class PostPolicy < BasePolicy
  class Scope < Scope
    def resolve
      if user
        if user.admin? || user.manager?
          scope.all
        else
          scope.none
        end
      else
        scope.none
      end
    end
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.admin? || user.manager?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.manager?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.manager?
  end
end
