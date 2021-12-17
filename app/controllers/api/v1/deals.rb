module API::V1 
   class Deals < Grape::API
       resource :deal do
           desc 'Create deal'
            params do
                requires :item_id,type: Integer,desc: 'Deal to create for item_id'
                requires :name,type: String,desc: 'Name of deal'
                requires :item_qty,type: Integer,desc: 'Qty of items offer is provided'
                requires :start_time,type: String,desc: 'start time of deal'
                requires :end_time,type: String,desc: 'end time of deal'
                requires :offer_price,type: Integer,desc: 'offer price for the item'
            end
            post '/item/:item_id' do
                 begin
                 deals=Deal.create_deals(params)
                 status(201)
                 status = { code: true , message:'Deal created successfully', deal_details: deals.get_deal_details}
                 status
                 rescue => e
                    status(500)
                    return {"code"=>false,msg:"Something went wrong while creating deal",error_msg:e.message}
                 end
            end

            desc 'Disable/end the deal'
            params do
                requires :deal_id,type: Integer,desc: 'deal_id to be disabled'
            end
            post '/:deal_id/end_deal' do
                 begin
                 deal=Deal.find_by_id(params['deal_id'])
                 deal.end_deal
                 status(201)
                 status = { code: true , message:'Deal disabled successfully', deal_details: deal.get_deal_details}
                 status
                
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong while disabling deal",error_msg:e.message}
                 end
            end

            desc 'Update deals details'
            params do
                requires :deal_id,type: Integer,desc: 'deal_id to update'
                optional :deals_name,type: String,desc: 'Name of deal'
                optional :item_qty,type: Integer,desc: 'Qty of items offer is provided'
                optional :start_time,type: String,desc: 'start time of deal'
                optional :end_time,type: String,desc: 'end time of deal'
                optional :offer_price,type: Integer,desc: 'offer price for the item'
                optional :is_active,type: Boolean,desc: 'Enable/Disable offer'
            end
             put '/:deal_id' do
                 begin
                 deal=Deal.find_by_id(params['deal_id'])
                 deal.update_details(params)
                 status(201)
                 status = { code: true , message:'Deal details updated successfully', deal_details: deal.get_deal_details}
                 status
                
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end

            params do
                requires :deal_id,type: Integer,desc: 'id of deal'
                requires :user_id,type: Integer, desc: 'id of user'
            end
             post '/:deal_id/apply_deal' do
                 begin
                 deal=Deal.find_by_id(params['deal_id'])
                 response = deal.apply_deal(params)
                 status(201)
                 status = { code: true , message:'Deal applied successfully', deal_details: response}
                 status
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end
       end
   end
end