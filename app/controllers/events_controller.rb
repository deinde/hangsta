class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Posted"
      end
    else
      flash[:alert] = "Problem with post"
      render :new
    end
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:body, :title, :date).merge(:current_user)
  end

end
