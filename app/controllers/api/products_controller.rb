class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  # before_action :authenticate_admin, except: [:index, :show]

  # everybody
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end
    if params[:discount] == "true"
      # do a thing
      @products = @products.where("price < ?", 100)
    end

    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    end
    render 'index.json.jbuilder'
  end

  # only admins
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      # if the user enters 'correct' information
      # data gets saved in db
      render 'show.json.jbuilder'
    else
      # if the user enters bad information
      # data does not get saved in db
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end


  # everybody
  def show
    p current_user
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  # only admins
  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    if @product.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  # only admins
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end
