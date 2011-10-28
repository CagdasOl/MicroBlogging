class PostsController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @post = @user.posts.build
  end

  def create

    @user = User.find(session[:user_id])
    @post = @user.posts.build(params[:post])
    if @post.save
      redirect_to_target_or_default(home)
    else
      render :action => "new"
    end
  end

end
