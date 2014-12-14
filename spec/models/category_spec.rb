require 'rails_helper'

RSpec.describe Category, :type => :model do
  it 'requires name' do
    category = Category.new
    expect(category).not_to be_valid
    category.name = 'Fruits'
    expect(category).to be_valid
  end

  it 'has many products' do
    category = Category.create(name: 'Fruits')
    apple = Product.create(name: 'Apple', price: 1)
    banana = Product.create(name: 'Banana', price: 2.50)
    category.products << apple << banana
    expect(category.products).to eq([apple, banana])
  end

  it 'count products' do
    category = Category.create(name: 'Fruits')
    apple = Product.create(name: 'Apple', price: 1)
    banana = Product.create(name: 'Banana', price: 2.50)
    category.products << apple << banana
    expect(category.count_products).to eq(2)
  end

  it 'total price' do
    category = Category.create(name: 'Fruits')
    apple = Product.create(name: 'Apple', price: 1)
    banana = Product.create(name: 'Banana', price: 2.50)
    category.products << apple << banana
    expect(category.total_price).to eq(3.50)
  end
end
