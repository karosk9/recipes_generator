# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiRecordCollection do
  let(:meals) { JSON.parse(Rails.root.join('spec/fixtures/recipe_collection.json').read) }
  subject { described_class.new(records: meals) }

  describe '#records' do
    it 'returns the records array' do
      expect(subject.records).to be_an(Array)
    end

    it 'returns correct number of elements in the array' do
      expect(subject.records.count).to eq(2)
    end

    it 'returns a collection of ApiRecord objects' do
      expect(subject.records.map(&:class).uniq).to eq([ApiRecord])
    end
  end
end
