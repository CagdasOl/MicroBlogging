class PostsController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @post }
    end
  end


  def returnHome

  end

end
