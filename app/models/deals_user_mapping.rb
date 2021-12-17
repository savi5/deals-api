class DealsUserMapping < ActiveRecord::Base
    self.table_name = 'deals_user_mappings'
    belongs_to :deals

     def self.create_deal_mappings(user,deal)
        DealsUserMapping.create!(user_id:user.id,deal_id:deal.id,is_applied:true)
     end
end