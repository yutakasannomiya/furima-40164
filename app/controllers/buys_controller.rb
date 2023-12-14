class BuysController < ApplicationController
  before_action :set_item

  def index
  end

  def new
    @item_user = ItemUser.new
  end

  def create
    @item_user = ItemUser.new(item_user_params)
    if @item_user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_user_params
    params.require(:item_user).permit(:post_code, :pref_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

   def set_item
    @item = Item.find(params[:item_id])
   end
end
