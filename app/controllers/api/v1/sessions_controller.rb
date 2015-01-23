module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        current_user.update authentication_token: nil
        respond_to do |format|
          format.json {
            render :json => {
              :user => current_user,
              :status => :ok,
              :authentication_token => current_user.authentication_token
            }
          }
        end
      end
    end
  end
end