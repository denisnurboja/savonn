class Product < ActiveRecord::Base
	validates :code, uniqueness: true

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end

	def self.to_csv2
		CSV.generate do |csv|
			csv << ["name", "price"]
			all.each do |product|
				csv << [product.name, product.price]
			end
		end
	end
end
