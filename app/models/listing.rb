class Listing < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	
	belongs_to :user
	has_many :bookings
	has_many :reviews

	acts_as_taggable
	acts_as_taggable_on :categories
	
end
