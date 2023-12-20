# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #random' do
    it 'returns a successful response', :aggregate_failures do
      single_record = JSON.parse(
        Rails.root.join('spec/fixtures/single_meal.json').read
      )
      meal_api_client = instance_double(MealApiClient)
      allow(MealApiClient).to receive(:new).and_return(meal_api_client)
      allow(meal_api_client).to receive(:random).and_return(single_record)

      get :random

      expect(controller.instance_variable_get(:@meal)).to be_a(ApiRecord)
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response', :aggregate_failures do
      single_record = JSON.parse(
        Rails.root.join('spec/fixtures/single_meal.json').read
      )
      meal_api_client = instance_double(MealApiClient)
      allow(MealApiClient).to receive(:new).and_return(meal_api_client)
      allow(meal_api_client).to receive(:meal_by_id).and_return(single_record)

      get :show, params: { id: 52_854 }

      expect(controller.instance_variable_get(:@meal)).to be_a(ApiRecord)
      expect(response).to be_successful
    end
  end

  describe 'GET #search' do
    it 'returns a successful response', :aggregate_failures do
      collection_of_records = JSON.parse(
        Rails.root.join('spec/fixtures/recipe_collection.json').read
      )
      meal_api_client = instance_double(MealApiClient)
      allow(MealApiClient).to receive(:new).and_return(meal_api_client)
      allow(meal_api_client).to receive(:search).and_return(collection_of_records)

      get :search

      expect(controller.instance_variable_get(:@meals)).to be_a(Array)
      expect(controller.instance_variable_get(:@meals).map(&:class).uniq.first).to eq(ApiRecord)
      expect(response).to be_successful
    end
  end
end
