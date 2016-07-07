class WikiPolicy < ApplicationPolicy

  def update?
    @user.present? && (@user.role.downcase == "admin" || @user == @record.user)
  end
end
