class HomeController < ApplicationController
  def index
    @users = User.all
    @title = "Home"
  end

  def join_us
  	
  end
end
