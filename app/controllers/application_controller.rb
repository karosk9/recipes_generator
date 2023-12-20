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

  rescue_from(*HTTP_ERRORS, with: :handle_connection_error)

  rescue_from ApiRecordCollection::InvalidSearchQueryError, with: :handle_invalid_search_query_error
  rescue_from BaseAdapter::ForbiddenInputError, with: :handle_forbidden_input_error

  private

  def handle_connection_error(error)
    log_error(error)

    redirect_to home_index_path, alert: I18n.t('errors.alerts.http_error')
  end

  def handle_forbidden_input_error(error)
    log_error(error)

    redirect_to home_index_path, alert: I18n.t('errors.alerts.forbidden_input')
  end

  def handle_invalid_search_query_error(error)
    log_error(error)

    redirect_to home_index_path, alert: I18n.t('errors.alerts.invalid_search_query')
  end

  def log_error(error)
    Rails.logger.error "[ERROR] Invalid search query error: #{error.message}"
    Rails.logger.error error.backtrace.join("\n").to_s
  end
end
