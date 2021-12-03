class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    # TODO: remove, no need for all users to be visible
    users = User.all
    render json: users
  end

  def show
    user = current_user
    if user
      render json: user, status: :ok
    else
      render_not_logged_in
    end
  end

  def create
    user = User.create!(user_params)
    token = encode_token(user_id: user.id)
    render json: {user: user, jwt: token}, status: :created
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
    params.permit(:username, :password, :password_confirmation)
  end
end
