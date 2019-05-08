class BrandsController < ApplicationController
  
  def show
    @brand = Brand.find(params[:id])
    @products = Product.where(brand_id: @brand.id)
  end
  
end
