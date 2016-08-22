class Trip < ApplicationRecord
	has_many :locations, dependent: :destroy
	has_many :pack_items, dependent: :destroy

	validates_presence_of :name

	def self.by_date
		order(:begin)
	end
end
