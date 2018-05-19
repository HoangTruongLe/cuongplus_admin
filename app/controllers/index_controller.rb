class IndexController < ApplicationController
  before_action :set_product, only: [:product_details]
  before_action :set_category, only: [:index]
  before_action :set_query

  def index
  end
  
  def product_details
  end
  
  def type_info
    @product_type = ProductType.find(params[:type_id])
  end
  
  def promotion_info
    @promotion = DashboardMessage.active.find(params[:promotion_id])
  end
  
  private
    def set_query
      @q = Product.is_not_draft.ransack(params[:q])
      @products = @q.result().search_order.page(params[:page]).per(15)
    end
    
    def set_product
      @product = Product.friendly_id.unscoped.find(params[:id])
    end
    
    def set_category
      @category = params[:category_id]? ProductCategory.all.find(params[:category_id]) : ProductCategory.first
    end
end
