class PagesController < ApplicationController

	before_action :authenticate_user!, only: [:completed]

	def index
	end

	def completed
		session[:token_id] = nil
		@user = current_user
	end

end
