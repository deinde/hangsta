class UsersController < ApplicationController
	before_action :set_user, only: [:show, :index] 

	def show
		@current_user = current_user
		
	end

	def index
		@users = User.all
	end 

	private
	def set_user
		@user= User.find_by(username: params[:username])
	end 
end
