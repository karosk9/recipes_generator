# frozen_string_literal: true

class ApiRecord
  def initialize(record:)
    @record = record
  end

  def id
    record['idMeal']
  end

  def origin
    record['strArea']
  end

  def name
    record['strMeal']
  end

  def image
    record['strMealThumb']
  end

  def category
    record['strCategory']
  end

  def instructions
    record['strInstructions']
  end

  def ingredients
    record.keys.grep(/strIngredient/).each.with_index(1).inject({}) do |result, (ingredient, i)|
      break result if record[ingredient].blank?

      result.merge(record[ingredient] => record["strMeasure#{i}"])
    end
  end

  attr_reader :record
end
