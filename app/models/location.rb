class Location < ApplicationRecord
	belongs_to :trip
	has_one :address, dependent: :destroy

	has_attached_file :image, styles: { small: ["300x300#", :jpg] }
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	validates_presence_of :where

	def self.is_like_options
		%w(None Beach Day\ Hike Camp\ Out Snowy Rural Metro Formal Boat)
	end

end
