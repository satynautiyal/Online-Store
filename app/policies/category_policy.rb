class CategoryPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
    def index?
        (@user.role == 'admin') || (@user.role == 'seller')
    end
  
    def show?
        (@user.role == 'admin') || (@user.role == 'seller')
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
  
  end
  