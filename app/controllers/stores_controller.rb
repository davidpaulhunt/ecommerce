class StoresController < ApplicationController

  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully create.'}
        format.js { render json: @store, status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.js { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.js { render json: @store, status: :updated, location: @store }
      else
        format.html { render action: 'edit' }
        format.js { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy!
    respond_to do |format|
      format.html { redirect_to stores_path, notice: 'Store was successfully destroyed.' }
      format.js { head :ok }
    end
  end

  private

  def store_params
    params.require(:store).permit(:user_id, :name, :web_url)
  end

  def set_store
    @store = Store.find(params[:id])
  end

end
