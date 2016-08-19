class Location < ApplicationRecord
	belongs_to :trip
	has_one :address, dependent: :destroy

	validates_presence_of :where
end
