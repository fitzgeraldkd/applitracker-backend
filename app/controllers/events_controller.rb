class EventsController < ApplicationController

  def index
    user = current_user
    events = current_user.events
    render json: events
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  def create
    event = Event.create!(event_params)
    render json: event, status: :created
  end

  def update
    event = Event.find(params[:id])
    event.update!(event_params)
    render json: event
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: "Event deleted."
  end

  private

  def event_params
    params.permit(:title, :description, :date, :status, :job_id)
  end

end
