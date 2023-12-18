class BuysController < ApplicationController
  before_action :set_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @fusion = Fusion.new
  end

  def new
  end

  def create
    @fusion = Fusion.new(buy_params)
    if @fusion.valid?
      pay_item
      @fusion.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def buy_params
    params.require(:fusion).permit(:post_code, :pref_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

   def set_item
    @item = Item.find(params[:item_id])
   end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: buy_params[:token],
      currency:'jpy'
    )
 end
end
