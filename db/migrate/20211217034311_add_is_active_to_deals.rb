class AddIsActiveToDeals < ActiveRecord::Migration
  def change
    add_column :deals,:is_active,:boolean,default: false
  end
end
