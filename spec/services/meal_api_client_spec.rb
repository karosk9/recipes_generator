# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealApiClient, type: :service do
  describe '#random' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(subject.random).to eq(api_response['meals'].first)
    end
  end

  describe '#meal_by_id' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(subject.meal_by_id(id: 52_854)).to eq(api_response['meals'].first)
    end
  end

  describe '#alphabetic_search' do
    it 'returns JSON response from external API' do
      api_response = JSON.parse(
        Rails.root.join('spec/fixtures/random_recipe_response.json').read
      )
      allow(HTTParty).to receive(:get).and_return(api_response)

      expect(subject.alphabetic_search(letter: 'p')).to eq(api_response['meals'])
    end

    it 'raises error when sctipt tag is passed as an input' do
      allow(HTTParty).to receive(:get).and_raise(URI::InvalidURIError)

      expect { subject.alphabetic_search(letter: "<script>alert('alert!')</script>") }.to raise_error(
        MealApiClient::ForbiddenInputError
      )
    end
  end
end
