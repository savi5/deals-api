module V1 
   class Deals < Grape::API
       version: 1,
       prefix :api,
       using  :json


       resource :deals do
            params do
                requires :item_id,type: Integer,
                requires :name,type: String
                requires :item_qty,type: Integer,
                requires :start_time,type: String,
                requires :end_time,type: String,
                requires :offer_price,type: Integer
            end
            post '/deals/:item_id' do
                 begin
                 deals=Deal.create_deals(params)
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end


            params do
                requires :deal_id,type: Integer,
            end
            delete '/end_deal/:deal_id' do
                 begin
                 deals=Deal.end_deal(params)
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end

            params do
                requires :deal_id,type: Integer,
                optional :end_time,type: String,
                optional :item_qty,type: Integer
            end
             put '/end_deal/:deal_id' do
                 begin
                 deals=Deal.update_details(params)
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end

            params do
                requires :deal_id,type: Integer,
                requires :cart_id,type: Integer
            end
             post '/apply_deal/:deal_id' do
                 begin
                 deals=Deal.apply_deal(params)
                 rescue => e
                    return {"code"=>false,msg:"Something went wrong",error_msg:e.message}
                 end
            end
       end
   end
end