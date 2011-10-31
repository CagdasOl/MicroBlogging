class HomeController < ApplicationController
  auto_complete_for :user, :username

  def index
  end


end
