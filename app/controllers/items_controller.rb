class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]   # ログインユーザー以外も可能なアクション
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_edit, only: :edit

  def index
    @items = Item.all.order(created_at: :desc)
    # 左上から、出品された日時が新しい順に表示
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :introduction, :category_id, :item_condition_id, :postage_payer_id,
      :shipping_area_id, :preparation_day_id, :price, :image
    ).merge(user_id: current_user.id)
    # カラムにはないが、imageを添付するので必要。
    # ユーザーIDはdeviseで使えるmergeメソッドで紐づける。
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 売却済ならトップページへ遷移
  def sold_edit
    redirect_to root_path if @item.purchase.present?
  end
end
