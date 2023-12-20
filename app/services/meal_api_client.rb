# frozen_string_literal: true

class MealApiClient
  MEAL_DB_URL = 'https://www.themealdb.com/api/json/v1/1/'
  ForbiddenInputError = Class.new(StandardError)

  def random
    HTTParty.get("#{MEAL_DB_URL}random.php")['meals'].first
  end

  def meal_by_id(id:)
    HTTParty.get("#{MEAL_DB_URL}lookup.php?i=#{id}")['meals'].first
  end

  def search(query:)
    HTTParty.get("#{MEAL_DB_URL}search.php?#{search_by(query)}")['meals']
  rescue URI::InvalidURIError
    raise ForbiddenInputError
  end

  private

  def search_by(query)
    query.size == 1 ? "f=#{query}" : "s=#{query}"
  end
end
