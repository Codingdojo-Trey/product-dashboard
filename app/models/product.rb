class Product < ActiveRecord::Base
	has_many :comments
	has_one :category
end
