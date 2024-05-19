class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @item = Item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # 行き先を指定。例えば、商品一覧表示ページなど
      redirect_to root_path
    else
      # 商品出品のページに再描画(render)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :item_name, :item_description, :category_id, :status_id, :cost_id, :address_id,
                                 :transit_time_id).merge(user_id: current_user.id)
  end
end
