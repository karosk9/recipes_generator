# frozen_string_literal: true

class ApiRecordCollection
  def initialize(records:)
    @records = records.map do |record|
      ApiRecord.new(record:)
    end
  end

  attr_reader :records
end
