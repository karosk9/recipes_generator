# frozen_string_literal: true

class RecipesController < ApplicationController
  def random
    @meal = ApiRecord.new(record: MealApiClient.new.random)
  end

  def search
    @meals = ApiRecordCollection.new(
      records: MealApiClient.new.alphabetic_search(letter: params[:query])
    ).records
  end

  def show
    @meal = ApiRecord.new(record: MealApiClient.new.meal_by_id(id: params[:id]))
  end
end
