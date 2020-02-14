module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        protect_from_forgery with: :null_session

        def create
          super
        end

        def render_create_success
          render json: @resource
        end

        private

        def sign_up_params
          params.permit(:provider, :uid, :screen_name, :name, :bio, :confirm_success_url)
        end

        def build_resource
          @resource = resource_class.new(sign_up_params)
        end
      end
    end
  end
end
