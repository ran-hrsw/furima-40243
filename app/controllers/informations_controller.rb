class InformationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @buying_address = BuyingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buying_address = BuyingAddress.new(information_params)
    if @buying_address.valid?
      pay_item
      @buying_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def information_params
    params.require(:buying_address).permit(:phone_number, :post_code, :city, :building_name, :address_id,
                                           :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = 'sk_test_c3520f22d1fcb16c83406366' # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: information_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.buying_history.present?
  end
end
