class ListsController < ApplicationController

  before_action :require_login

  layout 'application'

  def index
    @lists = current_user.lists
  end

end