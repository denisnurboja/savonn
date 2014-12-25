class ProductsController < ApplicationController
  def index
  	@products = Product.all.where("image_url IS NOT NULL")
    respond_to do |format|
      format.html
      format.xml {render xml:@users}
      format.csv {send_data @products.to_csv2}
    end
  end
  
  def new
  	@product = Product.new
  end
  
  def create
  	@product = Product.create(product_params)
    format.xml {render :show, status: :created, location: @product}
  end



private 
def product_params
	params.require(:product).permit(:code, :productgroupcode, :name, :manufacturer, :manufacturercode, :qttyinstock, :tax, :price, :pricenotax, :retailprice, :short_description, :warranty, :eur_exchange_rate, :barcode, :image_url, :special_offer)

end


end
