class ListsController < ApplicationController

  before_action :require_login

  layout 'application'

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
    @items = Item.all
  end

  def create
    list = List.new(list_params)
    list.user = current_user
    list.save
    redirect_to user_lists_path(current_user)
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    list = List.find_by(id: params[:id])
    list.update(list_params)
    redirect_to user_list_path(current_user, list)
  end

  def destroy
    List.find_by(id: params[:id]).destroy
    redirect_to user_lists_path(current_user)
  end

  def favorites
    @lists = current_user.lists.where(is_favorite: true)
    render :index
  end
  

  private

  def list_params
    params.require(:list).permit(:name, :is_favorite, item_ids: [])
  end

end