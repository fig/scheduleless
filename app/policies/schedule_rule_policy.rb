class ScheduleRulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.
        where(company_id: user.company_id).
        includes(:position).
        order("positions.name")
    end
  end

  def create?
    user.company_admin?
  end

  def index?
    user.company_admin?
  end
end