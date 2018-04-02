class IndexController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result().includes(:product_type).page(params[:page]).per(15)
  end
end
