class JobsController < ApplicationController

  def index
    user = current_user
    if user
      jobs = user.jobs
      render json: jobs
    else
      render_not_logged_in
    end
  end

  # TODO: determine if this is necessary
  # def show
  #   job = Job.find(params[:id])
  #   render json: job
  # end

  def create
    user = current_user
    if user
      job = user.jobs.create!(job_params)
      render json: job, status: :created
    else
      render_not_logged_in
    end
  end

  def update
    user = current_user
    if user
      job = Job.find(params[:id])
      job.update!(job_params)
      render json: job
    else
      render_not_logged_in
    end
  end

  def destroy
    if current_user
      job = Job.find(params[:id])
      if job.user_id == current_user.id
        job.destroy
        render json: "Job deleted."
      else
        render_not_logged_in # TODO: new error for unauthorized
      end
    else
      render_not_logged_in
    end
  end

  private

  def job_params
    params.permit(:company, :position, :status, :favorite, :user_id)
  end

end
