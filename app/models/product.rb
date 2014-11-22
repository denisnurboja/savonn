class Product < ActiveRecord::Base
	validates :code, uniqueness: true

def self.get_ct_data
  client = Savon.client(wsdl: "http://www.ct4partners.ba/webservices/ctproductsinstock.asmx?WSDL")
  message = {username: 'drtechno', password:'drtechno123' }
  response = client.call(:get_ct_products, message: message)
  data = response.body[:get_ct_products_response][:get_ct_products_result][:ctproduct]
end
def self.import_products
	priv = Product.get_ct_data
	priv.each do |prod|
		Product.create(priv)
	end


	end
end
