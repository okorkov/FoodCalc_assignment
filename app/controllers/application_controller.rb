class ApplicationController < ActionController::Base

  include ApplicationHelper 

  def welcome
    @user = User.new
  end

end
