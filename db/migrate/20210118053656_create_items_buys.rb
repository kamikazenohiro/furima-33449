class CreateItemsBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :items_buys do |t|

      t.timestamps
    end
  end
end
