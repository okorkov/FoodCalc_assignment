module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def require_login
    render 'errors/not_logged_in', :layout => nil if session[:user_id].nil?
  end

end
