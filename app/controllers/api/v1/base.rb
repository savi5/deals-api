module API::V1
    class Base < Grape::API
      version 'v1', using: :path
      format :json
      mount API::V1::Deals
    end
end