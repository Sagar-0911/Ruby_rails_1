class ProductsController < ApplicationController
  # GET method to get all products from the database
  def index
    @products = Product.all
  end

  # GET method to get a product by id
  def show
    @product = Product.find(params[:id])
  end

  # GET method for the new product form
  def new
    @product = Product.new
  end

  # POST method for processing form data
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product added!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to add product!'
      render :new
    end
  end

  # GET method for editing a product based on id
  def edit
    @product = Product.find(params[:id])
  end

  # PUT method for updating in the database a product based on id
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product updated!'
      redirect_to products_path
    else
      flash[:error] = 'Failed to update product!'
      render :edit
    end
  end

  # DELETE method for deleting a product from the database based on id
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = 'Product deleted!'
    else
      flash[:error] = 'Failed to delete this product!'
    end
    redirect_to root_path
  end

  # Strong parameters for the validation of params
  private

  def product_params
    params.require(:product).permit(:name, :price, :short_description)
  end
end
