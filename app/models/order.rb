class Order
  include ActiveModel::Model
  attr_accessor :items_buy_id, :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :block_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipalities
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]+\z/}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
   items_buy = ItemsBuy.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, block_number: block_number,
                   building_name: building_name, phone_number: phone_number, items_buy_id: items_buy.id)
  end
end