class UpdateUserMobile < ActiveRecord::Migration
  def change
    change_column :users, :mobile, :string, limit: 20

  end
end
