class EventsController < ApplicationController

  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    flash[:notice] = "event was successfully created"
    redirect_to events_url
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update  
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = "event was successfully updated"
    redirect_to event_url(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to events_url
  end

  def show
    @event = Event.find(params[:id])
    @page_title = @event.name
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end
end
