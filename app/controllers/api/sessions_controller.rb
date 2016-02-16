class Api::SessionsController < ApiController
	def create
		@user=User.find_by_email_and_password(params[:email],params[:password])

		if @user
			http_status_response status: :ok, message: "User Autheticated", data: {id:@user.id, email:@user.email, first_name: @user.first_name || "", last_name: @user.last_name || "", auth_token: @user.auth_token, auth_token_expiration: @user.auth_token_expiration}
		else
			http_status_response status: :not_found, message: "User not found"
		end
	end
end
