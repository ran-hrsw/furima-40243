class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:destroy, :edit]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
    def redirect_if_present?
      redirect_to root_path if @item.present?
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :item_name, :item_description, :category_id, :status_id, :cost_id, :address_id,
                                 :transit_time_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id || @item.buying_history.present?
  end
end
