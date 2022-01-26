class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.role == 'admin'
  end

  def show?
    @user.role == 'admin' || @user.id == @record.id
  end

  def soft_destroy?
    ((@user.role == 'admin') || (@user.id == @record.id))
  end

  def destroy?
    (@user.role == 'admin')
  end

  def restore_soft_deleted?
    (@user.role == 'admin')
  end
end
