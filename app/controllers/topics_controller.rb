class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: "Topic added succesfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render @topics
    end
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
