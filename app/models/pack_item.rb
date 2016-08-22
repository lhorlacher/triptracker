class PackItem < ApplicationRecord
	belongs_to :trip

	validates_presence_of :name, :location

	def self.mark_packed(item)
		item[:packed] = true
		item
	end

	def self.loc_options(trip)
		options = ['General']
		trip.locations.each do |location|
			options	<< location.where.to_s
		end
		options
	end

	def self.by_is_like(trip)
		options = []
		trip.locations.each do |location|
			options << location.is_like.to_s
		end
		options.uniq
	end


	def self.filter_items(location)
		where(location: location).where(packed: false)
	end

	def self.filter_packed_items(location)
		where(location: location).where(packed: true)
	end

	def self.pack_recs
		{beach: ['sunscreen', 'towel'], formal: ['tie', 'dress shoes'], dayhike: ['water bottle', 'hiking shoes'], metro: ['walking shoes', 'transportation plans', 'pepper spray'], snowy: ['gloves', 'scarf', 'wool socks'] }
	end
end
