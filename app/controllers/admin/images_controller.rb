class Admin::ImagesController < ApplicationController
	before_action :set_coach

	def create
	  add_more_images(images_params[:images])
	  flash[:error] = "Failed uploading images" unless @coach.save
	  redirect_to :back
	end

	def destroy
	  remove_image_at_index(params[:id].to_i)
	  flash[:error] = "Failed deleting image" unless @coach.save
	  redirect_to :back
	end

	private

	def set_coach
	  @coach = Coach.find(params[:coach_id])
	end

	def add_more_images(new_images)
	  images = @coach.images # copy the old images 
	  images += new_images # concat old images with new ones
	  @coach.images = images # assign back
	end

	def remove_image_at_index(index)
	  remain_images = @coach.images # copy the array
	  deleted_image = remain_images.delete_at(index) # delete the target image
	  deleted_image.try(:remove!) # delete image from S3
	  if @coach.images.size == 1
	  	@coach.remove_images!
	  	@coach.save!
	  else
	  	@coach.images = remain_images # re-assign back	
	  end
	  
	end

	def images_params
	  params.require(:coach).permit({images: []}) # allow nested params as array
	end
end

