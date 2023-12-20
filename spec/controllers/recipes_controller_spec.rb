# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #random' do
    it 'returns a successful response', :aggregate_failures do
      single_record = JSON.parse(
        Rails.root.join('spec/fixtures/single_meal.json').read
      )
      allow(TheMealDbAdapter).to receive(:random).and_return(single_record)

      get :random

      expect(controller.instance_variable_get(:@meal)).to be_a(MealDbApiRecord)
      expect(response).to be_successful
    end
  end

  describe 'GET #random_drink' do
    it 'returns a successful response', :aggregate_failures do
      single_record = JSON.parse(
        Rails.root.join('spec/fixtures/single_drink.json').read
      )
      allow(TheCoctailDbAdapter).to receive(:random).and_return(single_record)

      get :random_drink

      expect(controller.instance_variable_get(:@drink)).to be_a(CoctailDbApiRecord)
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response', :aggregate_failures do
      single_record = JSON.parse(
        Rails.root.join('spec/fixtures/single_meal.json').read
      )
      allow(TheMealDbAdapter).to receive(:meal_by_id).and_return(single_record)

      get :show, params: { id: 52_854 }

      expect(controller.instance_variable_get(:@meal)).to be_a(MealDbApiRecord)
      expect(response).to be_successful
    end
  end

  describe 'GET #search' do
    it 'returns a successful response', :aggregate_failures do
      collection_of_records = JSON.parse(
        Rails.root.join('spec/fixtures/recipe_collection.json').read
      )
      allow(TheMealDbAdapter).to receive(:search).and_return(collection_of_records)

      get :search

      expect(controller.instance_variable_get(:@meals)).to be_a(Array)
      expect(controller.instance_variable_get(:@meals).map(&:class).uniq.first).to eq(MealDbApiRecord)
      expect(response).to be_successful
    end
  end
end
