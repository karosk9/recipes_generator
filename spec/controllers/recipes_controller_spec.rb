# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #random' do
    it 'returns a successful response' do
      allow(HTTParty).to receive(:get).and_return({ 'meals' => [{ 'idMeal' => '1' }] })

      get :random
      expect(response).to be_successful
    end
  end

  describe 'GET #search' do
    it 'returns a successful response' do
      allow(HTTParty).to receive(:get).and_return({ 'meals' => [{ 'idMeal' => '1' }] })

      get :search
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do 
    it 'returns a successful response' do
      allow(HTTParty).to receive(:get).and_return({ 'meals' => [{ 'idMeal' => '1' }] })
      
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end
  end
end
