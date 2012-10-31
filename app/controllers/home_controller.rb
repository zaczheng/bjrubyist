class HomeController < ApplicationController
  def index
    @users = User.all
    @title = "Home"
    @event = Event.first
  end

  def join_us
  end
end
