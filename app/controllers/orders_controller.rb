class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)
    @order.status = 'confirming'
    respond_to do |format|
      if @order.save
        @order.confirm!
        format.html { redirect_to @order, notice: 'The Order was successfully created.' }
        format.js { render json: @order, status: :created, location: @order }
      else
        @order.order_items.build
        format.html { render action: 'new' }
        format.js { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'The Order was successfully updated.' }
        format.js { render json: @order, status: :updated, location: @order }
      else
        format.html { render action: 'edit' }
        format.js { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy!
    respond_to do |format|
      format.html { redirect_to orders_path, notic: 'The Order was successfully destroyed.' }
      format.js { header :ok }
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email_address, :billing_address1, :billing_address2, :billing_city, :billing_state, :billing_zipcode, :company, :billing_country_id, :notes, :separate_shipping_address, :delivery_address1, :delivery_address2, :delivery_city, :delivery_state, :delivery_zipcode, :delivery_country_id, :amount_paid, :store_id, :received_at, :accepted_at, :order_items_attributes => [:product_id, :quantity, :id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
