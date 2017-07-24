class Category < ActiveRecord::Base
	has_many :books #one category can have many books
end
