class ProductPolicy < ApplicationPolicy
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
    new?
  end

  def new?
    (@user.role == 'admin') || (@user.role == 'seller')
  end

  def update?
    (@user.role == 'admin') || (@user.id == @record.user_id)
  end

  def edit?
    update?
  end

  def soft_destroy?
    ((@user.role == 'admin') || (@user.id == @record.user_id))
  end

  def destroy?
    (@user.role == 'admin')
  end

  def restore_soft_deleted?
    (@user.role == 'admin')
  end
  
end
