class ListsController < ApplicationController

  before_action :require_login

  def index
    @lists = current_user.lists
  end

end