# frozen_string_literal: true

class BaseAdapter
  ForbiddenInputError = Class.new(StandardError)

  def self.random
    raise NotImplementedError
  end

  def self.meal_by_id(id:)
    raise NotImplementedError
  end

  def self.search(query:)
    raise NotImplementedError
  end

  def self.search_by(query)
    query.size == 1 ? "f=#{query}" : "s=#{query}"
  end
end
