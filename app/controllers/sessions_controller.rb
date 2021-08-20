class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      @error = "No user with this email found"
      @user = User.new(email: params[:email])
      render "application/welcome"
    else
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_lists_path(user)
      else
        @error = "Invalid password"
        @user = User.new(email: params[:email])
        render "application/welcome"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def google
    user = User.find_or_create_by(email: auth['email'])
    user.password = SecureRandom.hex(10) if user.password_digest.nil?
    user.save
    if user && user.id
      session[:user_id] = user.id
      redirect_to user_lists_path(user)
    else
      redirect_to root_path
    end
  end

  private 

  def auth
    request.env['omniauth.auth']['info']
  end

end