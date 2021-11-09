class ProductsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :create]
  def index
    @procudts = Product.includes(:user).order("created_at DESC")

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
    @product = Product.find(params[:id])
  end

  private
  def products_params
    params.require(:product).permit(:category_id, :product_name, :description, :prefecture_id, :shipping_cost_id, :shipping_days_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end 

  

  
end