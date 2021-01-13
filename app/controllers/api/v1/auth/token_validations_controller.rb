module Api
  module V1
    module Auth
      class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
        protect_from_forgery with: :null_session

        def validate_token
          super
        end
      end
    end
  end
end
