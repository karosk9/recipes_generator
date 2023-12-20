# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TheMealDbAdapter do
  describe '#random' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(described_class.random).to eq(api_response['meals'].first)
    end
  end

  describe '#meal_by_id' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(described_class.meal_by_id(id: 52_854)).to eq(api_response['meals'].first)
    end
  end

  describe '#search' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(described_class.search(query: 'p')).to eq(api_response['meals'])
    end

    it 'raises error when sctipt tag is passed as an input' do
      allow(HTTParty).to receive(:get).and_raise(URI::InvalidURIError)

      expect { described_class.search(query: "<script>alert('alert!')</script>") }.to raise_error(
        BaseAdapter::ForbiddenInputError
      )
    end
  end
end
