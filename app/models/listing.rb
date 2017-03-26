class Listing < ApplicationRecord
	validates :name, presence: true
	
	belongs_to :user
	has_many :bookings
	has_many :reviews

	acts_as_taggable
	acts_as_taggable_on :categories

	def self.search(search)
  	where("name LIKE ? OR description LIKE ? OR city_location LIKE ?", "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.capitalize}%") 
	end
	
end
