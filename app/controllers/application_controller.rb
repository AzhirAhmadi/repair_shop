# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionController::RequestForgeryProtection
  include Pundit

  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  def authenticate_user!(*_args)
    return unless check_authorization_token?
    return unless current_user || User.find_by_jti(decode_authorization_token)
  end

  def check_authorization_token?
    return true unless request.headers['Authorization'].blank?

    render json: {
      success: false,
      response: 'check_authorization_token',
    }, status: :forbidden
    return false
  end

  def check_json_format
    sign_out unless request.format == :json
  end

  def decode_authorization_token
    return nil if request.headers['Authorization'].blank?

    token = request.headers['Authorization'].split('Bearer ').last
    secret = ENV['DEVISE_JWT_SECRET_KEY']
    JWT.decode(token, secret, true, algorithm: 'HS256', verify_jti: true)[0]['jti']
  rescue JWT::DecodeError
    render json: {
      success: false,
      response: 'rescue JWT::DecodeError',
    }, status: :forbidden
  end

  def render_access_denied
    render json: {
      success: false,
      response: 'Access denied',
    }, status: :forbidden
  end
end
