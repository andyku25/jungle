class Admin::DashboardController < ApplicationController
  def show
    @products = Product.all
    @categories = Category.distinct.all
  end
end
