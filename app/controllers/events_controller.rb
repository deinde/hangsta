class EventsController < ApplicationController
  def index
    @events = Event.all.newest_first
    @user = User.find_by(username: params[:username])
    # @place = Place.new
    @hash = Gmaps4rails.build_markers(Event.all) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.body
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
  end

  def new
    @event = Event.new
    # if @event.save
    #   redirect_to events_path
    # else
    #   render :index
    # end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Posted"
      redirect_to(events_path)
    else
      flash[:alert] = "Problem with post"
      render :new

    end

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Post updated"
      redirect_to events_path
    else
      flash[:alert] = "Problem"
      redirect_to events_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params

    params.require(:event).permit(:body, :title, :date, :image, :user_id, :address, :latitude, :longitude).merge(user: current_user)

  end

end
