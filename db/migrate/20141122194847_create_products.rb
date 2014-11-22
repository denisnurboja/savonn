class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :code
    	t.string :productgroupcode
    	t.string :name
    	t.string :manufacturer
    	t.string :manufacturercode
    	t.string :qttyinstock
    	t.string :tax
    	t.string :price
    	t.string :pricenotax
    	t.string :retailprice
    	t.text :short_description
    	t.string :warranty
    	t.string :eur_exchange_rate
    	t.string :barcode
    	t.string :image_url
    	t.string :special_offer

      t.timestamps
    end
  end
end
