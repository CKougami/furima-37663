class PurchaseAddress
  include ActiveModel::Model  # モジュール、Formオブジェクトを使用できるようにする記述。
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :tel,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, tel: tel,
                           purchase_id: purchase.id)
  end
end
