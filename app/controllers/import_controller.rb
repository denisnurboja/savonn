class ImportController < ApplicationController
  def index
  
  end
  def new
  	@product = Product.new
  end

  def create
  	import_products
	@priv.each do |prod|
		Product.create(prod)
	end
	redirect_to products_path, notice: "import completed!"

  end

private
  def get_ct_data
  client = Savon.client(wsdl: "http://www.ct4partners.ba/webservices/ctproductsinstock.asmx?WSDL")
  message = {username: 'drtechno', password:'drtechno123' }
  response = client.call(:get_ct_products, message: message)
  data = response.body[:get_ct_products_response][:get_ct_products_result][:ctproduct]
end
def import_products
	@priv = get_ct_data
	end
end
