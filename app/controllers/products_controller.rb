class ProductsController < ApplicationController
  #this method displays all of the products
  def index
    @products = Product.all
  end

  #this method will just serve a form to make a new product!
  def new
    @categories = Category.all
  end

  def create
    # this needs strong parameters!
    product = Product.new(product_params)
    product.category = Category.find(params[:category])
    if product.save
      redirect_to "/products"
    else
      render :text => "something went wrong!"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update_attributes(product_params)
      redirect_to "/products"
    else
      render :text=> 'not updated!'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to "/products"
  end

  private
    def product_params
      params.require(:product).permit(:pricing, :name, :description)
    end
end
