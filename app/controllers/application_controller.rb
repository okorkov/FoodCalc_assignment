class ApplicationController < ActionController::Base

  def welcome
    render json: {welcome: 'Welcome'}
  end
end
