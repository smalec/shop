class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true

  def count_products
    products.count
  end

  def total_price
    sum = 0
    products.each do |product|
      sum += product.price
    end
    sum
  end
end
