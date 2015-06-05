class PlacesController < ApplicationController
def index
  	@place = Place.new
  	@hash = Gmaps4rails.build_markers(Place.all) do |place, marker|
  		marker.lat place.latitude
  		marker.lng place.longitude
  		marker.infowindow place.description
  	end
  end

  def create
  	@place = Place.new(params.require(:place).permit(:address, :title, :description))
  	if @place.save
  		redirect_to root_path
  	else
  		render :index
  	end
  end
end
