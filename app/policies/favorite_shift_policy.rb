class FavoriteShiftPolicy < ApplicationPolicy
  def create?
    UserPermissions.for(user).manage?(current_location)
  end

  def new?
    UserPermissions.for(user).manage?(current_location)
  end
end
