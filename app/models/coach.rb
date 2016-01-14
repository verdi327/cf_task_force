class Coach < ActiveRecord::Base
	mount_uploaders :images, ImageUploader
end
