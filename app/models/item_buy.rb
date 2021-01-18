class ItemBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :block_number, :building_name, :phone_number, :items_buy
end