require 'rails_helper'

RSpec.describe Product, :type => :model do
  it 'requires name' do
    product = Product.new
    expect(product).not_to be_valid
    product.price = 1
    expect(product).not_to be_valid
    product.name = 'Apple'
    expect(product).to be_valid
  end

  it 'requires price' do
    product = Product.new
    expect(product).not_to be_valid
    product.name = 'Apple'
    expect(product).not_to be_valid
    product.price = 1
    expect(product).to be_valid
  end

  it 'requires price to be greater or equal 0' do
    product = Product.new(name: 'Apple', price: -1)
    expect(product).not_to be_valid
    product.price = 0
    expect(product).to be_valid
    product.price = 1
    expect(product).to be_valid
  end

  it 'belongs to category' do
    category = Category.create(name: 'Fruits')
    product = Product.create(name: 'Apple', price: 1)
    product.category = category
    expect(product.category.name).to eq('Fruits')
  end
end
