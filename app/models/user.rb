class User < ApplicationRecord
  include Clearance::User
  has_many :listings
  has_many :reviews
  has_many :bookings
end
