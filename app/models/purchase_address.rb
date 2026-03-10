class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building, :phone_number, :token

  validates :user_id, :item_id, :token, :post_number, :prefecture_id, :city, :address, :phone_number, presence: true
  validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end