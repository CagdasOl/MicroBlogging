class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      session[:user_name] = user.username
      flash[:notice] = "Logged in successfully."
      @posts = user.posts
      @user = user
      redirect_to "/user/"+session[:user_name]
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    logger.info("session is destroyed!")
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end

end
