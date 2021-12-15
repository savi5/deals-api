class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :deals_name
      t.references :products
      t.integer :item_qty
      t.integer :offer_price 
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps null: false
    end
  end
end
