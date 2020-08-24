class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buy = UserInfomation.new
  end

  def create
    @buy = UserInfomation.new(infomation_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def infomation_params
    params.permit(:post_code, :shipping_area_id, :city, :house_name, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: infomation_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
end
