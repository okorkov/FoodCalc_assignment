module ApplicationHelper

  def current_user
    Guest.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def require_login
    # render 'viewpath' if session[:user_id].nil?
  end

end
