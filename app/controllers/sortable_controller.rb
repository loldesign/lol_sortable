class SortableController < ApplicationController
  respond_to :json

  before_filter :validate_params, only: :prioritize

  def prioritize
    params[:resource].classify.constantize.prioritize params[:ids]

    render nothing: true

    rescue Exception => e
      render_error(e.message)
  end

  private
  def validate_params
    render_error("must send ids params with resources listed") unless params[:ids].present?
  end

  def render_error(message)
    render text: {error_message: message}.to_json, status: :error
  end
end