class Trip < ApplicationRecord
	has_many :locations, dependent: :destroy

	validates_presence_of :name
end
