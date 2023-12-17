# frozen_string_literal: true

class RecipesController < ApplicationController
  def random
    @meal = call_api['meals'].first
  end

  private

  def call_api
    HTTParty.get('https://www.themealdb.com/api/json/v1/1/random.php')
  end
end
