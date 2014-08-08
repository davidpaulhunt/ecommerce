class ProductCategoriesController < ApplicationController

  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    respond_to do |format|
      if @product_category.save
        format.html { redirect_to @product_category, notice: 'Category was successfully created.' }
        format.js { render json: @product_category, status: :created, location: @product_category }
      else
        format.html { render action: 'new' }
        format.js { render json: @product_category.errors, status: :unproccessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to @product_category, notice: 'Category was successfully updated.' }
        format.js { render json: @product_category, status: :updated, location: @product_category }
      else
        format.html { render action: 'edit' }
        format.js { render json: @product_category.errors, status: :unproccessable_entity }
      end
    end
  end

  def destroy
    @product_category.destroy!
    respond_to do |format|
      format.html { redirect_to product_categories_path, notice: 'Category was successfully destroyed.' }
      format.js { header :ok }
    end
  end

  private

  def product_category_params
    params.require(:product_category).permit(:store_id, :name, :description)
  end

  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

end
