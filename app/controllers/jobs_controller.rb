class JobsController < ApplicationController

  def index
    render json: @user.jobs
  end

  # TODO: determine if this is necessary
  # def show
  #   job = Job.find(params[:id])
  #   render json: job
  # end

  def create
    job = @user.jobs.create!(job_params)
    render json: job, status: :created
  end

  def update
    job = Job.find(params[:id])
    if job.user_id == @user.id
      job.update!(job_params)
      render json: job
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  def destroy
    job = Job.find(params[:id])
    if job.user_id == @user.id
      job.destroy
      head :no_content
    else
      render_not_logged_in # TODO: new error for unauthorized
    end
  end

  private

  def job_params
    params.permit(:company, :position, :status, :favorite, :user_id)
  end

end
