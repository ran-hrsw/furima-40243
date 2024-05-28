class InformationsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buying_address = BuyingAddress.new
  end

  def create
    @buying_address = BuyingAddress.new(information_params)
    if @buying_address.valid?
      @buying_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def information_params
    params.require(:buying_address).permit(:phone_number, :post_code, :city, :building_name, :address_id,
                                           :number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

# 一旦の目標
# 郵便番号などをテーブルに保存すること

# ①買う商品を正しく表示する
# ①
# @item = ...
# コントローラーとviewの修正
# ②都道府県などが表示されるようにviewを編集する(hogeの部分)
# ③form_withにmodel, urlオプションの指定
# 例: model:@item, createアクションへのリクエストの指定
# createアクションへのリクエストが飛んでいれば一旦成功
