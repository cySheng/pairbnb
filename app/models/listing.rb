class Listing < ApplicationRecord
	belongs_to :user
	has_many :bookings
	has_many :reviews

	acts_as_taggable
	acts_as_taggable_on :categories
end
