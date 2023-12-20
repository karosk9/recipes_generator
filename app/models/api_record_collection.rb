# frozen_string_literal: true

class ApiRecordCollection
  InvalidSearchQueryError = Class.new(StandardError)

  def initialize(records:, api_record_type:)
    @records = records.map do |record|
      api_record_type.new(record:)
    end
  rescue NoMethodError
    raise InvalidSearchQueryError
  end

  attr_reader :records
end
