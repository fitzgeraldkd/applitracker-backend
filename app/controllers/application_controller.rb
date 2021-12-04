class ApplicationController < ActionController::API
  before_action :authorized
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def current_user
    @user ||= User.find_by(id: decoded_token['user_id']) if decoded_token
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { errors: ['You are not logged in.'] }, status: :unauthorized unless logged_in?
  end

  def render_record_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: { errors: [error] }, status: :not_found
  end

  def render_not_logged_in
    render json: { errors: ['You are not logged in.'] }, status: :unauthorized
  end

  def encode_token(payload)
    JWT.encode(payload, ENV['jwt_token'])
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['jwt_token'], true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
