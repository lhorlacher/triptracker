class Trip < ApplicationRecord
	has_many :locations, dependent: :destroy

	validates_presence_of :name

	def self.by_date
		order(:begin)
	end
end
