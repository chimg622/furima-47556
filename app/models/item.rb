class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_scheduled

  belongs_to :user
  has_many :purchases
  has_one_attached :image

  validates :image, :name, :info, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_scheduled_id, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_scheduled_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999 
  }
end

