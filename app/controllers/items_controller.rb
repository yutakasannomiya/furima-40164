class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :condition_id, :shipping_id, :pref_id, :scheduled_day_id, :item_price).merge(user_id: current_user.id)
  end

end
