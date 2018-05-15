class IndexController < ApplicationController
  before_action :set_product, only: [:product_details]
  before_action :set_category, only: [:index]

  def index
  end
  
  def product_details
  end
  
  private
    def set_product
      @product = Product.find(params[:id])
    end
    
    def set_category
      @category = ProductCategory.find_by(id: params[:category_id]) || ProductCategory.first
    end
end
