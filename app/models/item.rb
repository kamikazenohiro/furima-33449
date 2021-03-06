class Item < ApplicationRecord
  belongs_to :user
  has_one :items_buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
