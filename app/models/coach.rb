class Coach < ActiveRecord::Base
	validates :name, presence: true
	validates :title, presence: true
	validates :description, presence: true
	
	mount_uploaders :images, ImageUploader
end
