class LikesController < ApplicationController
  def index
    likes = Like.where(user_id: current_user_id)
  end

  def new
    like = Like.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)

    if @like.save
      flash[:notice] = "Bookmark liked!"
      redirect_to [@bookmark.topic]
    else
      flash.now[:alert] = "Error unliking. Please try again."
      redirect_to [@bookmark.topic]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find_by(bookmark_id: @bookmark.id)

    if @like.destroy
      flash[:notice] = "Bookmark unliked!"
      redirect_to [@bookmark.topic]
    else
      flash.now[:alert] = "Error unliking. Please try again."
      redirect_to [@bookmark.topic]
    end
  end

end
