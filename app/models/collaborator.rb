class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  def create
    wiki = Wiki.find(params[:wiki_id])
    collaborator = current_user.collaborators.build(wiki: wiki)
    collaborator.save
    redirect_to wikis_path
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    collaborator =current_user.collaborators.find(params[:id])
    collaborator.destroy
    redirect_to wikis_path
  end
end
