class HomeController < ApplicationController
  def index
    @users = User.all
    @title = "Home"
  end
end
