class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if @item.purchase.present?
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id]) # 金額取得のために必要
    Payjp.api_key = "sk_test_b5fe59910f61bbbe5811be15" 
    Payjp::Charge.create(
      amount: @item.price,             # @item から価格を取得
      card: purchase_params[:token],   # purchase_params からトークンを取得
      currency: 'jpy'
  )
  end
end
