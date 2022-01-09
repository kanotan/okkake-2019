module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        protect_from_forgery with: :null_session

        def create
          super
        end

        def render_create_success
          render json: @resource
        end
      end
    end
  end
end
