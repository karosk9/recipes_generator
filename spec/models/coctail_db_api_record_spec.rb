# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoctailDbApiRecord do
  let(:meal) { JSON.parse(Rails.root.join('spec/fixtures/single_drink.json').read) }
  subject { described_class.new(record: meal) }

  describe '#id' do
    it 'returns meal id' do
      expect(subject.id).to eq('17830')
    end
  end

  describe '#origin' do
    it 'returns meal origin' do
      expect(subject.origin).to eq(nil)
    end
  end

  describe '#name' do
    it 'returns meal name' do
      expect(subject.name).to eq('Corn n Oil')
    end
  end

  describe '#image' do
    it 'returns meal image URL' do
      expect(subject.image).to eq('https://www.thecocktaildb.com/images/media/drink/pk6dwi1592767243.jpg')
    end
  end

  describe '#category' do
    it 'returns meal category' do
      expect(subject.category).to eq('Cocktail')
    end
  end

  describe '#instructions' do
    it 'returns meal instructions' do
      expect(subject.instructions).to eq('Cut the half lime in half again. Add the lime, falernum, and bitters to a rocks glass. Muddle. Add the rum. (Aged Barbados rum such as Plantation 5 Year is recommended). Add ice and stir. Float the blackstrap rum on top. Serve with a straw.')
    end
  end

  describe '#ingredients' do
    it 'returns meal ingredients' do
      expect(subject.ingredients).to eq({
                                          'Lime' => '1/2',
                                          'Falernum' => '1/3 oz',
                                          'Angostura Bitters' => '2 dashes',
                                          'Añejo rum' => '1 oz',
                                          'blackstrap rum' => '1 oz'
                                        })
    end
  end
end
