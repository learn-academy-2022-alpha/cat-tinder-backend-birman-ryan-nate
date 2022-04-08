require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'Create Animal' do
    it 'wont create a animal in the database without a name' do
      animal = Animal.create age: 999, enjoys: 'playing with yarn', image: 'url find one'
        p animal.errors[:name]
        expect(animal.errors[:name]).to_not be_empty
      end
    end
  describe 'Wont create an animal without age' do
    it 'wont create a animal in the database without a age' do
      animal = Animal.create name: 'moster truck', enjoys: 'playing with yarn', image: 'url find one'
        p animal.errors[:age]
        expect(animal.errors[:age]).to_not be_empty
    end
  end
  describe 'Wont create an animal without an enjoys' do
    it 'wont create a animal in the database without a enjoys' do
      animal = Animal.create name: 'moster truck', age: 999, image: 'url find one'
        p animal.errors[:enjoys]
        expect(animal.errors[:enjoys]).to_not be_empty
    end
  end
  describe 'Wont create an animal without an image' do
    it 'wont create a animal in the database without an image' do
      animal = Animal.create name: 'moster truck', age: 999, enjoys: 'playing with yarn'
        p animal.errors[:image]
        expect(animal.errors[:image]).to_not be_empty
    end
  end  
  describe 'Create Animal without the enjoys at least 10 characters long' do
    it 'wont create a animal in the database without the enjoys 10 characters long' do
      animal = Animal.create name: 'moster truck', enjoys: 'play', image: 'url find one'
        p animal.errors[:enjoys]
        expect(animal.errors[:enjoys]).to_not be_empty
    end
  end
end
