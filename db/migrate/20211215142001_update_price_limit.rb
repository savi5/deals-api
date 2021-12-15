class UpdatePriceLimit < ActiveRecord::Migration
  def change
    change_column :products, :price, :integer, limit: 8
    change_column :deals, :offer_price, :integer, limit: 8

  end
end
