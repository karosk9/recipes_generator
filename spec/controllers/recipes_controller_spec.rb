# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #random' do
    it 'returns a successful response' do
      get :random
      expect(response).to be_successful
    end
  end
end
