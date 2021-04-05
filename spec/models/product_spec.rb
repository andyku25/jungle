require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should be valid with all required parameters passed" do
      @category = Category.new(name: "Vehicles")
      @product = Product.new(
        name: "Car",
        price: 2999,
        quantity: 20,
        category: @category
      )
      @product.save
      expect(@product).to be_valid 
    end
    
    it "should be invalid with error msg missing 'name' parameter" do
      @category = Category.new(name: "Sport")
      @product = Product.new(
        name: nil,
        price: 79,
        quantity: 80,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it "should be invalid with error msg missing 'price' parameter" do
      @category = Category.new(name: "Collectible")
      @product = Product.new(
        name: "Pokemon Cards",
        price: nil,
        quantity: 2,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it "should be invalid with error msg missing 'quantity' parameter" do
      @category = Category.new(name: "Computers")
      @product = Product.new(
        name: "Graphics Card",
        price: 800,
        quantity: nil,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it "should be invalid with error msg missing 'category' parameter" do
      @category = Category.new(name: "Clothes")
      @product = Product.new(
        name: "Supreme",
        price: 500,
        quantity: 50,
        category: nil
      )
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
