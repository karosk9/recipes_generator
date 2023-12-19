# frozen_string_literal: true

class RecipesController < ApplicationController
  def random
    @meal = call_api['meals'].first

  def search
    @meals = HTTParty.get("https://www.themealdb.com/api/json/v1/1/search.php?f=#{params[:query]}")
  end

  def show
    @meal = HTTParty.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{params[:id]}")
  end

  private

  def call_api
    HTTParty.get('https://www.themealdb.com/api/json/v1/1/random.php')
  end
end
