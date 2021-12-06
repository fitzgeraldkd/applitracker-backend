class CommunicationsController < ApplicationController

  def index
    render json: @user.communications
  end

  def create
    job = Job.find_by!(id: params[:job_id])
    if job.user_id == @user.id
      communication = job.communications.create!(communication_params)
      render json: communication, status: :created
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  def update
    communication = Communication.find(params[:id])
    if communication.job.user_id == @user.id
      communication.update!(communication_params)
      render json: communication
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  def destroy
    communication = Communication.find(params[:id])
    if communication.job.user_id == @user.id
      communication.destroy
      head :no_content
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  private

  def communication_params
    params.permit(:heading, :description, :time, :received, :contact, :job_id)
  end

end
