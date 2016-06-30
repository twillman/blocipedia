class WikisController < ApplicationController
  def new
    @wiki=Wiki.new
  end

  def create
    # purpose: Stores a wiki in the database
    @wiki = Wiki.create(params[:wiki].permit!)

    redirect_to new_wiki_path
  end

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(params.require(:wiki).permit(:title, :body, :private))
    if @wiki.save
      redirect_to @wiki
    else
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end
end
