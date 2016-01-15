class Wod < ActiveRecord::Base
	validates :name, presence: true
	validates :publish_on, presence: true
	validates :image, presence: true

	mount_uploader :image, WodUploader
end
