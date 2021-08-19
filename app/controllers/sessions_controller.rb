class SessionsComponent < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      @error = "No user with this email found"
      render "application/welcome"
    else
      if user && user.authenticate(params[:password])
        session[:user] = user.id
        redirect_to user_lists_path(user)
      else
        @error = "Invalid password"
        render "application/welcome"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def google
    user = User.find_or_create_by(email: auth['email']) do |u|
      u.password = SecureRandom.hex(10) if user.password_digest.nil?
      u.save
    end
    if user && user.id
      session[:user] = user.id
      redirect_to user_lists_path(user)
    else
      redirect_to redirect_to root_path
    end
  end

  private 

  def auth
    request.env['omniauth.auth']['info']
  end

end