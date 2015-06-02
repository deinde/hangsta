class EventsController < ApplicationController
  def index
    @events = Event.all
    @users = User.all.newest_first
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

    params.require(:event).permit(:body, :title, :date, :image, :user_id).merge(user: current_user)

  end

end
