class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new             # 保存できなければnewアクションへ戻る
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :item_name, :introduction, :category_id, :item_condition_id, :postage_payer_id, 
      :shipping_area_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
    # カラムにはないが、imageを添付するので必要。
    # ユーザーIDはdeviseで使えるmergeメソッドで紐づける。
  end
end
