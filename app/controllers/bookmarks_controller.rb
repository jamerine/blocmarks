class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic = @topic
    @bookmark.user = current_user

    if @bookmark.save
      flash.now[:alert] = "Bookmark added successfully."
      redirect_to @topic
    else
      flash.now[:error] = "Error creating bookmark. Please try again."
      render :new
    end

  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.update_attributes(bookmark_params)
    if @bookmark.save
      redirect_to @topic, notice: "Bookmark updated succesfully."
    else
      flash.now[:error] = "Error updating bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:error] = "There was an error deleting the bookmark."
      render @topic
    end

  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end
end
