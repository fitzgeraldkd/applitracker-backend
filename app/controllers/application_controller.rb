class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def current_user
    # TODO: implement authorization/authentication
    User.first
  end

  def render_record_invalid(invalid)
    render json: invalid.record.errors.full_messages
  end

  def render_not_found(error)
    render json: error
  end
end
