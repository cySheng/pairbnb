class Listing < ApplicationRecord
	validates :name, presence: true
	mount_uploaders :photos, AvatarUploader

	scope :search, -> (search) {where("name LIKE ? OR description LIKE ? OR city LIKE ? OR country LIKE ?", "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.capitalize}%", "%#{search.capitalize}%")}
	scope :location, -> (location) {where("street LIKE ? OR city LIKE ? OR state LIKE ? OR country LIKE ?", "%#{location.capitalize}%", "%#{location.capitalize}%", "%#{location.capitalize}%", "%#{location.capitalize}%")}
	scope :check_in, -> (check_in) {where("date_start >= ?", "#{check_in}")}
	scope :check_out, -> (check_out) {where("date_end <= ?", "#{check_out}")}
	scope :guests_no, -> (guests_no) {where("number_of_guests >= ?", "#{guests_no}")}
 
	belongs_to :user
	has_many :bookings
	has_many :reviews

	acts_as_taggable
	acts_as_taggable_on :categories

	def self.look(location, start_date, end_date, pax)
		where("state LIKE ? OR country LIKE ? OR city LIKE ? AND date_start >= ? AND date_end <= ? AND number_of_guests >= ?", "%#{location.capitalize}%", "%#{location.capitalize}%","%#{location.capitalize}%","#{start_date}", "#{end_date}", "#{pax}")
	end

end
