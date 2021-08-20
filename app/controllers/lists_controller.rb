class ListsController < ApplicationController

  before_action :require_login

  layout 'application'

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    raise params.inspect
  end

end