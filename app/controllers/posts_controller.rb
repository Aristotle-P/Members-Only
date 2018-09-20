class PostsController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @list = Post.all
    @users = User.all
  end

  def create
    Post.create(content: params[:post][:content], user_id: current_user.id)
    redirect_to root_url
  end
end
