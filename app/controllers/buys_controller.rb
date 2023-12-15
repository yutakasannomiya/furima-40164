class BuysController < ApplicationController
  before_action :set_item

  def index
    @fusion = Fusion.new
  end

  def new
  end

  def create
    @fusion = Fusion.new(buy_params)
    if @fusion.valid?
      @fusion.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def buy_params
    params.require(:fusion).permit(:post_code, :pref_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

   def set_item
    @item = Item.find(params[:item_id])
   end
end
