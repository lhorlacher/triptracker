class Location < ApplicationRecord
	belongs_to :trip
	has_one :address, dependent: :destroy

	validates_presence_of :where

	def self.is_like_options
		%w(Beach Forest Snowy Rural Metro Formal Boat Sports)
	end

end
