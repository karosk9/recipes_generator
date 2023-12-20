# frozen_string_literal: true

class TheMealDbAdapter < BaseAdapter
  MEAL_DB_URL = 'https://www.themealdb.com/api/json/v1/1/'

  def self.random
    HTTParty.get("#{MEAL_DB_URL}random.php")['meals'].first
  end

  def self.meal_by_id(id:)
    HTTParty.get("#{MEAL_DB_URL}lookup.php?i=#{id}")['meals'].first
  end

  def self.search(query:)
    HTTParty.get("#{MEAL_DB_URL}search.php?#{search_by(query)}")['meals']
  rescue URI::InvalidURIError
    raise BaseAdapter::ForbiddenInputError
  end
end
