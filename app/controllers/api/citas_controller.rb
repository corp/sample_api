class Api::CitasController < ApiController
	before_action :verify_user_token, only: [:index]

	def index
		@citas = @current_user.appointments
	end
end

