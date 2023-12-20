# frozen_string_literal: true

class RecipesController < ApplicationController
  def random
    @meal = MealDbApiRecord.new(record: TheMealDbAdapter.random)
  end

  def search
    @meals = ApiRecordCollection.new(
      records: TheMealDbAdapter.search(query: params[:query]), api_record_type: MealDbApiRecord
    ).records
  end

  def show
    @meal = MealDbApiRecord.new(record: TheMealDbAdapter.meal_by_id(id: params[:id]))
  end

  def random_drink
    @drink = CoctailDbApiRecord.new(record: TheCoctailDbAdapter.random)
  end
end
