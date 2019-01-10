class ProductsController < ApplicationController
  before_action :logged_in_user

  def index
    @filterrific = initialize_filterrific(
      Product,
      params[:filterrific]
    ) or return

    @products = @filterrific.find.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end
end
