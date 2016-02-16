class ApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :verify_api_token
	respond_to :json

	def verify_api_token
		http_status_response(status: :unauthorized, message: "Bad API key") unless params[:api_token]=="token-secreto"
	end

	def verify_user_token
		http_status_response(status: :unauthorized, message: "Bad User Auth token") unless @current_user = User.find_by_auth_token(params[:auth_token])
	end

	def http_status_response(status:nil, message:"", data:nil)
		response_hash = {status:status, message:message}
		response_hash.store(:data,data) unless data.nil?
	 	render json: response_hash.to_json, status: status and return
	end
end
