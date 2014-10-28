class OrdersController < ApplicationController
  layout 'item'

  before_action :check_cart, only: :new

  # GET /orders/new
  def new
  end

  private

    def check_cart
      redirect_to root_url if current_cart.empty_cart?
    end
end