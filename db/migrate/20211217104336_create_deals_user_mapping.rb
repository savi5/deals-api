class CreateDealsUserMapping < ActiveRecord::Migration
  def change
    create_table :deals_user_mappings do |t|
      t.references :user
      t.references :deal
      t.boolean :is_applied,default: false
      t.timestamps null: false
    end
  end
end
