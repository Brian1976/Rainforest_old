class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@products = Product.find(params[:id])
	end

	def new
		@products = Product.new
	end

	def create

		@products = Product.new(params[:product])
		if @products.save
			redirect_to products_url
		else
			render :new
		end
	end

	def edit
		@products = Product.find(params[:id])
	end

	def update
		@products = Product.find(params[:id])

		if @products.update_attributes(params[:product])
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def destroy
		@products = Product.find(params[:id])
		@products.destroy
	end
end