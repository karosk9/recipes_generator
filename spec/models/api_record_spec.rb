# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiRecord do
  let(:meal) { JSON.parse(Rails.root.join('spec/fixtures/single_meal.json').read) }
  subject { described_class.new(record: meal) }

  describe '#id' do
    it 'returns meal id' do
      expect(subject.id).to eq('52854')
    end
  end

  describe '#origin' do
    it 'returns meal origin' do
      expect(subject.origin).to eq('American')
    end
  end

  describe '#name' do
    it 'returns meal name' do
      expect(subject.name).to eq('Pancakes')
    end
  end

  describe '#image' do
    it 'returns meal image URL' do
      expect(subject.image).to eq('https://www.themealdb.com/images/media/meals/rwuyqx1511383174.jpg')
    end
  end

  describe '#category' do
    it 'returns meal category' do
      expect(subject.category).to eq('Dessert')
    end
  end

  describe '#instructions' do
    it 'returns meal instructions' do
      expect(subject.instructions).to eq("Put the flour, eggs, milk, 1 tbsp oil and a pinch of salt into a bowl or large jug, then whisk to a smooth batter. Set aside for 30 mins to rest if you have time, or start cooking straight away.\r\nSet a medium frying pan or crêpe pan over a medium heat and carefully wipe it with some oiled kitchen paper. When hot, cook your pancakes for 1 min on each side until golden, keeping them warm in a low oven as you go.\r\nServe with lemon wedges and sugar, or your favourite filling. Once cold, you can layer the pancakes between baking parchment, then wrap in cling film and freeze for up to 2 months.")
    end
  end

  describe '#ingredients' do
    it 'returns meal ingredients' do
      expect(subject.ingredients(meal)).to eq({
                                                'Flour' => '100g ',
                                                'Eggs' => '2 large',
                                                'Milk' => '300ml ',
                                                'Sunflower Oil' => '1 tbls',
                                                'Sugar' => 'to serve',
                                                'Raspberries' => 'to serve',
                                                'Blueberries' => 'to serve'
                                              })
    end
  end
end
