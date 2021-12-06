class EventsController < ApplicationController

  def index
    render json: @user.events
  end

  # TODO: determine if this is necessary
  # def show
  #   event = Event.find(params[:id])
  #   render json: event
  # end

  def create
    job = Job.find_by!(id: params[:job_id])
    if job.user_id == @user.id
      event = job.events.create!(event_params)
      render json: event, status: :created
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  def update
    event = Event.find(params[:id])
    if event.job.user_id == @user.id
      event.update!(event_params)
      render json: event
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.job.user_id == @user.id
      event.destroy
      head :no_content
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  private

  def event_params
    params.permit(:title, :description, :date, :job_id)
  end

end
