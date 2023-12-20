# frozen_string_literal: true

class ApplicationController < ActionController::Base
  HTTP_ERRORS = [
    EOFError,
    Errno::ECONNRESET,
    Errno::EINVAL,
    Net::HTTPBadResponse,
    Net::HTTPHeaderSyntaxError,
    Net::ProtocolError,
    Timeout::Error,
    SocketError
  ].freeze

  rescue_from(*HTTP_ERRORS, with: :handle_api_error)

  private

  def handle_api_error(error)
    Rails.logger.error "[ERROR] Failed to connect with API error: #{error.message}"
    Rails.logger.error error.backtrace

    redirect_to home_index_path, alert: I18n.t('errors.alerts.http_error')
  end
end
