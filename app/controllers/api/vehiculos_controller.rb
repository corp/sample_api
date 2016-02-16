class Api::VehiculosController < ApiController
	before_action :verify_user_token, only: [:index]

	def index
		@vehiculos = @current_user.vehicles
		if params[:min_year].to_i
			@vehiculos = @vehiculos.where("year >= ?", params[:min_year])
		end
	end
end
