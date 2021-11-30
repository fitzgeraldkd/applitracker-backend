class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: "User deleted."
  end

  private

  def user_params
    params.permit(:username)
  end
end
