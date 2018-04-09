class IndexController < ApplicationController
  before_action :set_product, only: [:product_details]

  def index
    @q = Product.is_not_draft.ransack(params[:q])
    @products = @q.result().includes(:product_type).page(params[:page]).per(15)
  end
  
  def product_details

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
