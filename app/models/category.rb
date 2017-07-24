class Category < ActiveRecord::Base
	has_many :books #one category can have many books

	#validation. presence means if it's required or not, length is min length of the string in this case
	validates :name, presence: true, length: {minimum:3}
end
