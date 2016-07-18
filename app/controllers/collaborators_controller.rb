class CollaboratorsController < ApplicationController
  def create
    Collaborator.create(params[:collaborator].permit!)
    redirect_to wikis_path
  end

  def destroy
    @user= User.find(params[:collaborator][:user_id])
    @wiki = Wiki.find(params[:collaborator][:wiki_id])
    @collaborator=@wiki.collaborators.find_by(user_id: @user.id)
    @collaborator.delete
    redirect_to wikis_path
  end
end
