class ProductsController < ApplicationController
  def index
  	@products = Product.where(id: 1099..1114)
  end
  
  def new
  	@product = Product.new
  end
  
  def create
  	@product = Product.create(product_params)
  end

  def import
  end
  

private 
def product_params
	params.require(:product).permit(:code, :productgroupcode, :name, :manufacturer, :manufacturercode, :qttyinstock, :tax, :price, :pricenotax, :retailprice, :short_description, :warranty, :eur_exchange_rate, :barcode, :image_url, :special_offer)

end
end
