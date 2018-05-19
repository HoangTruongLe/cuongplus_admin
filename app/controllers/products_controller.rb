class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :copy]
  before_action :set_query, only: [:index, :destroy]


  # GET /products
  # GET /products.json
  def index
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.draft = true
    @product.save(validate: false)
    redirect_to edit_product_path(@product)
  end

  # GET /products/1/edit
  def edit
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update!(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render json: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def copy
    new_product = @product.dup
    new_product.save!
    redirect_to edit_product_path(new_product)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.unscoped.find(params[:id])
    end

    def set_query
      @q = Product.ransack(params[:q])
      @products =  @q.result().order(updated_at: :desc).page(params[:page]).per(20)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product] = params[:product].reject{|k, v| v.empty?}
      params[:product][:price] = params[:product][:price].gsub(',', '').to_i if params[:product][:price]
      params[:product][:instalment] = params[:product][:instalment].gsub(',', '').to_i if params[:product][:instalment]
      params.require(:product).permit(:name, :position, :price, :product_type_id, :status, :instalment, :description,
        :upload_files_attributes => [:id, :file, :_destroy]).merge(draft: false)
    end
end
