class RelationshipsController < ApplicationController

	def create
		event = Event.find(params[:followed_id])
		current_user.follow(event)
		redirect_to event
	end

	def destroy
		event = Relationship.find(params[:id]).followed
		current_user.unfollow(event)
		redirect_to event
	end
	
end