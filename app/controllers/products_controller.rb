class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.js { render json: @product, status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.js { render json: @product.errors, status: :unproccessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.js { render json: @product, status: :updated, location: @product }
      else
        format.html { render action: 'edit' }
        format.js { render json: @product.errors, status: :unproccessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      format.js { header :ok }
    end
  end

  private

  def product_params
    params.require(:product).permit(:store_id, :product_category_id, :name, :sku, :price, :description, :short_description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
