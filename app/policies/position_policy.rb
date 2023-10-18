class PositionPolicy < BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin? || user.manager?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def close_position?
    create?
  end
end
