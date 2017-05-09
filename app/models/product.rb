class Product < ActiveRecord::Base
  validates :title, :price, presence: true
  validates :title, uniqueness: true
  
  def display_price
    price/100.0
  end
end