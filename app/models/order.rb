class Order
  include ActiveModel::Model
  attr_accessor: :user, :item, :postal_code, :prefecture, :municipalities, :block_number, :building_name, :phone_number

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipalities
    validates :block_number
    validates :phone_number
  end

  validates :prefecture, numericality: { other_than: 0, message: "Prefecture Select" }

  def save
    item_buy = ItemBuy.create(user_id: user.id, item_id: item.id) 
    
    Address.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, block_number: block_number,
                   building_name: building_name, phone_number: phone_number, user_id: user.id, item_id: item.id)
  end

end