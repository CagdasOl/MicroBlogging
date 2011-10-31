class UsersController < ApplicationController
  auto_complete_for :user, :username

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      render 'users/show'
    else
      render :action => 'new'
    end
  end

  def createPost
    logger.info("Trying to update status! " + session[:user_name])
    @user = User.find_by_username(session[:user_name])
    @posts = @user.posts
    logger.info("posting content : " + params[:content])
    @post = Post.new(:content => params[:content], :user_id => session[:user_id])
    if @post.save
      redirect_to :back
    else
      render :action => "new"
    end
  end

  def displayUser
    if !logged_in?
      logger.info("no user is logged in!")
    else
      session[:username] = params[:username]
      @posts = Post.find_all_by_user_id(User.find_by_sql("select id from users where username = '" + params[:username]+"'"))
      for i in current_user.friendships
        @posts += Post.find_all_by_user_id(i.friend_id)
      end if current_user.username.eql? params[:username]
      @posts = @posts.sort_by { |p| p.created_at }
      render :template => 'users/show'
    end
  end


end
