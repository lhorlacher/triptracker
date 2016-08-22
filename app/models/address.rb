class Address < ApplicationRecord
	belongs_to :location

	validates_presence_of :street, :city, :state, :country, :zip
end
