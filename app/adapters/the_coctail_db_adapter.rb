# frozen_string_literal: true

class TheCoctailDbAdapter < BaseAdapter
  DRINK_DB_URL = 'https://www.thecocktaildb.com/api/json/v1/1/'

  def self.random
    HTTParty.get("#{DRINK_DB_URL}random.php")['drinks'].first
  end

  def self.meal_by_id(id:)
    HTTParty.get("#{DRINK_DB_URL}lookup.php?i=#{id}")['drinks'].first
  end

  def self.search(query:)
    HTTParty.get("#{DRINK_DB_URL}search.php?#{search_by(query)}")['drinks']
  rescue URI::InvalidURIError
    raise BaseAdapter::ForbiddenInputError
  end
end
