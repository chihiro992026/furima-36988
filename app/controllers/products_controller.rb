class ProductsController < ApplicationController
   before_action :set_product, only: [:show, :edit, :update, :destroy]
   before_action :contributor_confirmation, only: [:edit, :destroy]
   before_action :authenticate_user!, except: [:index, :create, :show]
  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end  
    
  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end
  
  def update 
    if @product.update(products_params)
    redirect_to product_path(@product)
    else
      render :edit
    end  
  end 
  
  def destroy
   @product.destroy
   if @product.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end  
  end 
  
  private
  def products_params
    params.require(:product).permit(:category_id, :product_name, :description, :prefecture_id, :shipping_cost_id, :shipping_days_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end 
 
  def set_product
    @product = Product.find(params[:id])
  end  

  def contributor_confirmation
    redirect_to root_path unless current_user == @product.user
  end

  
end