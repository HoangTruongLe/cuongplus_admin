class ProductTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_type, only: [:show, :edit, :update, :destroy, :copy]
  before_action :set_query, only: [:index, :destroy]
  # GET /product_types
  # GET /product_types.json
  def index
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show
  end

  # GET /product_types/new
  def new
    @product_type = ProductType.new
    @product_type.draft = true
    @product_type.save(validate: false)
    redirect_to edit_product_type_path(@product_type)
  end

  # GET /product_types/1/edit
  def edit
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)
    respond_to do |format|
      if @product_type.save
        format.html { redirect_to product_types_url, notice: 'Product type was successfully created.' }
        format.json { render :index, status: :created, location: @product_type }
      else
        format.html { render :new }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    respond_to do |format|
      @product_type.assign_attributes(product_type_params)
      @product_type.avatar = nil if params[:avatar_del] == 'true'
      if @product_type.save!
        format.html { redirect_to product_types_url, notice: 'Product type was successfully updated.' }
        format.json { render :index, status: :ok, location: @product_type }
      else
        format.html { render :edit }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type.destroy
  end

  def copy
    new_product_type = @product_type.dup
    new_product_type.save!
    redirect_to edit_product_type_path(new_product_type)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.unscoped.find(params[:id])
    end

    def set_query
      @q = ProductType.ransack(params[:q])
      @product_types =  @q.result().order(updated_at: :desc).page(params[:page]).per(20)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :product_category_id, :position, :title, :provider, :os, :language, :screen_type,
        :color, :resolution, :screen_size, :font_camera, :back_camera, :flash,
        :video_mode, :video_call, :cpu, :ram, :chipset, :address_memory, :maximum_memory,
        :built_in_memory, :extra_memory, :weight, :size, :battery_capacity, :c3g, :c4g,
        :bluetooth, :gprs, :gps, :usb, :sim_card_port, :sim_card, :wifi, :video_player,
        :mp3_player, :fm_radio, :recoder, :description, :avatar).merge(draft: false)
    end
end
