class WelcomeController < ApplicationController

	before_action :set_user, only: [:index] 
	def index
	end

	private
	def set_user
		@user= User.find_by(username: params[:username])
	end 
end