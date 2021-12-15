class Deal < ActiveRecord::Base
    self.table_name = 'deals'
    def create_deals
        begin
         deal = {};
         deal['deals_name'] = params['name'];
         deal['product_id']  = params['item_id'];
         deal.item_qty = params['item_qty'];
         deal.start_time = params['start_time'];
         deal.end_time = params['end_time'];
         deal.offer_price = params['offer_price'];
         Deal.create!(deal);
        rescue => e
            return e
        end
    end

    
    def end_deal
        begin
         deal = {};
         deal['id']=params['deal_id'];
         Deal.destroy!(deal);
        rescue => e
            return e
        end
    end

    def update_details
        begin
         deal = {};
         deal['item_qty'] = params['item_qty'] if params['item_qty'].present?
         deal['end_time'] = params['end_time'] if params['end_time'].present?
         Deal.where(deal_id:params['deal_id']).update!(deal);
        rescue => e
            return e
        end
    end

    def apply_deal
        begin
            cart = Cart.find_by_cart_id(params['cart_id'])
            qty = cart.qty
            deal = Deal.find_by_deal_id(params['deal_id'])
            deal_update = {}
            error!({}) if deal.end_time < Time.now
            deal_update['item_qty'] = deal.qty - cart.qty

        rescue => e
            return e
        end
    end

end
