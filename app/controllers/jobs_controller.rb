class JobsController < ApplicationController

  def index
    user = current_user
    jobs = user.jobs
    render json: jobs
  end

  def show
    job = Job.find(params[:id])
    render json: job
  end

  def create
    job = Job.create!(job_params)
    render json: job, status: :created
  end

  def update
    job = Job.find(params[:id])
    job.update!(job_params)
    render json: job
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    render json: "Job deleted."
  end

  private

  def job_params
    params.permit(:company, :position, :status, :favorite, :user_id)
  end

end
