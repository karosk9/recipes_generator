# frozen_string_literal: true

class ApiRecordCollection
  InvalidSearchQueryError = Class.new(StandardError)

  def initialize(records:)
    @records = records.map do |record|
      ApiRecord.new(record:)
    end
  rescue NoMethodError
    raise InvalidSearchQueryError
  end

  attr_reader :records
end
