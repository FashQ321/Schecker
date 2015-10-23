class PagesController < ApplicationController

	before_action :authenticate_user!, only: [:completed]

	def index
	end

	def completed
		session[:token_id] = nil
		@user = current_user
	end

	def dummy_endpoint
		result = {
			:code => "200",
			:size => "L",
			:brand => "Dolce&Gabbana"
		}
		render json: result
	end

end
