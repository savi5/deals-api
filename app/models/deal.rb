class Deal < ActiveRecord::Base
    self.table_name = 'deals'
    has_many :deals_user_mappings
    def self.create_deals(params)
        begin 
         deal = {};
         
         deal_obj = Deal.create!(
            deals_name: params['name'],
            products_id: params['item_id'],
            item_qty:params['item_qty'],
            start_time: params['start_time'],
            end_time: params['end_time'],
            offer_price: params['offer_price'],
            is_active: true
         );
         return deal_obj
        rescue => e
            raise e
        end
    end

    
    def end_deal
        begin
         self.update({is_active: false});
        rescue => e
            raise e
        end
    end

    def update_details(params)
        begin
         deal={}
         deal['end_time'] = params['end_time'] if params['end_time'].present?
         deal['deals_name'] = params['deals_name'] if params['deals_name'].present?
         deal['start_time'] = params['start_time'] if params['start_time'].present?
         deal['end_time'] = params['end_time'] if params['end_time'].present?
         deal['item_qty'] = params['item_qty'] if params['item_qty'].present?
         deal['offer_price'] = params['offer_price'] if params['offer_price'].present?
         deal['is_active'] = params['is_active'] if params['is_active'].present?
         self.update(deal);
        rescue => e
            raise e
        end
    end

    def apply_deal(params)
        begin
            user = User.find_by_id(params['user_id'])
            deal_mapping = self.deals_user_mappings.where(user_id: user.id).first
            deal_update = {}
            raise "Deal #{self.deals_name} already used" if deal_mapping.present? && deal_mapping.is_applied
            raise "Deal time limit ended" if self.end_time < Time.now
            raise "Deal expired" if self.item_qty == 0
            self.update(item_qty: self.item_qty-1)
            if deal_mapping.present?
                deal_mapping.update!(is_applied: true);
            else
            DealsUserMapping.create_deal_mappings(user,self);
            end
            mapping_details = {}
            mapping_details['user_id'] = user.id
            mapping_details['deal_name'] = self.deals_name
            return mapping_details
        rescue => e
            raise e
        end
    end

    def get_deal_details
        deal = {};
        deal['id'] = self.id
        deal['deals_name'] = self.deals_name
        deal['product_id']  = self.products_id
        deal['item_qty'] = self.item_qty
        deal['start_time'] = self.start_time
        deal['end_time'] = self.end_time
        deal['offer_price'] = self.offer_price
        deal['is_active'] = self.is_active
        deal
    end

end
