class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  validates :image,    presence: true
  validates :name,     presence: true
  validates :describe, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  validates :category_id,     numericality: { other_than: 0 }
  validates :condition_id,    numericality: { other_than: 0 }
  validates :shipping_fee_id, numericality: { other_than: 0 }
  validates :prefecture_id,   numericality: { other_than: 0 }
  validates :delivery_day_id, numericality: { other_than: 0 }
end
