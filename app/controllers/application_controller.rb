#All other controllers inherit from ApplicationController so this is where i put all of my error handlings

class ApplicationController < ActionController::API
  include ActionController::Cookies
  #using the ! operator on create, update, and destroy will return a RecordInvalid exception when an error occurs, using find() will return a RecordNotFound exception
  #use rescue_from in place of an if/else to conditionally render error messages
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private

  def render_invalid_response(exception)
    #will render clean list of messages telling user what went wrong with request
    render json: { errors: exception.record.errors.full_messages }, status: 422
  end

  def render_not_found_response(exception)
    #will render the message the model you're requesting from is not found
    #example: incorrect id
    render json: { error: "#{exception.model} not found" }, status: :not_found
  end
end
