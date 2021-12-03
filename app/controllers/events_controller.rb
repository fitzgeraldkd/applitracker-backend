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
    user = current_user
    p user
    p 'test'
    if user
      job = Job.find_by(id: params[:job_id])
      if job.user_id == user.id
        event = Event.create!(event_params)
        render json: event, status: :created
      else
        render_not_logged_in # TODO: new error for unauthorized
      end
    else
      render_not_logged_in
    end
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
    params.permit(:title, :description, :date, :job_id)
  end

end
