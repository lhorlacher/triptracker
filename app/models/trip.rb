class Trip < ApplicationRecord
	has_many :locations, dependent: :destroy
	has_many :pack_items, dependent: :destroy

	validates_presence_of :name

	has_attached_file :image, styles: { small: ["300x300#", :jpg] }
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
	
	def self.by_date
		order(:begin)
	end
end
