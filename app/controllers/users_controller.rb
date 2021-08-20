class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to user_lists_path(user)
    else
      @error = user.errors.full_messages.first
      @user = user
      render "application/welcome"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end