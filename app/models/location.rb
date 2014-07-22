class Location < ActiveRecord::Base
  validates :location, presence: true, uniqueness: true
end
