class ApplicationController < ActionController::Base

  include ApplicationHelper 

  layout 'welcome'

  def welcome
    redirect_to user_lists_path(current_user) if logged_in?
    @user = User.new
  end

end
