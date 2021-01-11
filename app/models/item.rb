class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  validates :category_id,     numericality: { other_than: 1 }
  validates :condition_id,    numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
end
