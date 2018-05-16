class ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_category, only: [:show, :edit, :update, :destroy, :copy]
  before_action :set_query, only: [:index, :destroy]
  
  def index
  end

  def show
  end

  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to product_categories_url, notice: 'Product type was successfully created.' }
        format.json { render :index, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to product_categories_url, notice: 'Product type was successfully updated.' }
        format.json { render :index, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_category.destroy
  end

  def copy
    new_product_category = @product_category.dup
    new_product_category.save!
    redirect_to edit_product_category_path(new_product_category)
  end

  private
    def set_product_category
      @product_category = ProductCategory.all.find(params[:id])
    end

    def set_query
      @q = ProductCategory.ransack(params[:q])
      @product_categories =  @q.result().order(updated_at: :desc).page(params[:page]).per(20)
    end

    def product_category_params
      params.require(:product_category).permit(:name, :activity, :position)
    end
end
