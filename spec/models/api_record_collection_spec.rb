# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiRecordCollection do
  subject { described_class.new(records: meals, api_record_type: MealDbApiRecord) }

  describe '#records' do
    let(:meals) { JSON.parse(Rails.root.join('spec/fixtures/recipe_collection.json').read) }

    it 'returns the records array' do
      expect(subject.records).to be_an(Array)
    end

    it 'returns correct number of elements in the array' do
      expect(subject.records.count).to eq(2)
    end

    it 'returns a collection of ApiRecord objects' do
      expect(subject.records.map(&:class).uniq).to eq([MealDbApiRecord])
    end
  end

  describe 'error handling' do
    describe 'invalid search query' do
      let(:meals) { nil }

      it 'raises an error' do
        expect { subject }.to raise_error(ApiRecordCollection::InvalidSearchQueryError)
      end
    end
  end
end
