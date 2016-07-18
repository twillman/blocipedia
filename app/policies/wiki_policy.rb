class WikiPolicy < ApplicationPolicy

  def update?
    @user.present? && (@user.role.downcase == "admin" || @user.id == @record.user_id || @record.collaborators.find_by(@user.id))
  end
end
