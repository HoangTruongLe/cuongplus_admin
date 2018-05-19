class IndexController < ApplicationController
  before_action :set_product, only: [:product_details]
  before_action :set_category, only: [:index]

  def index
    @q = Product.is_not_draft.ransack(params[:q])
    @products = @q.result().search_order.page(params[:page]).per(15)
  end
  
  def product_details
  end
  
  private
    def set_product
      @product = Product.friendly_id.unscoped.find(params[:id])
    end
    
    def set_category
      @category = params[:category_id]? ProductCategory.all.find(params[:category_id]) : ProductCategory.first
    end
end
