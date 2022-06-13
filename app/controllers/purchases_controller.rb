class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase
  before_action :items_user

  def index
    @purchase_address = PurchaseAddress.new   # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item # 決済処理
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  # 売却済み商品の購入ページへアクセスしようとするとトップページへ遷移
  def purchase
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  # 決済処理
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  # 自分が出品した商品を購入しようとするとトップページへ遷移
  def items_user
    redirect_to root_path if current_user.id == @item.user.id
  end
end
