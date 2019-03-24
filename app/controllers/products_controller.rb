class ProductsController < ApplicationController
  def new
    @suppliers = Supplier.all
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )


    @product.save
    Image.create!(url: params[:image], product_id: @product.id)
    p "here are the errors"
    p @product.errors.full_messages
    # i don't have a show, so I'm redirecting back to new
    redirect_to "/products/new"
  end
end
