class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.find_by(email: params[:sender])

    @topic = Topic.find_by(title: params[:subject])

    @url = params["body-plain"]

    if @user == nil
      @user = User.new
      @user.email = params[:sender]
      @user.name = "New User"
      @user.password = 'password'
      @user.save!
    end

    if @topic == nil
      @topic = Topic.new
      @topic.title = params[:subject]
      @topic.user_id = @user.id
      @topic.save!
    end

    @bookmark = Bookmark.new
    @bookmark.topic_id = @topic.id
    @bookmark.url = @url.strip
    @bookmark.user = @user
    @bookmark.save!

    head 200
  end
end
