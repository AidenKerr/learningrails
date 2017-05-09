class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product #{@product.title} created"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      flash[:notice] = "Product #{@product.title} edited"
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product #{@product.title} destroyed"
    redirect_to root_path
  end
  
  private
  
  def product_params
    params.require(:product).permit(:title, :price)
  end
end