class Tools::WendlersController < Tools::BaseController
	def index;end

	def create
		if params[:weight].empty? && params[:bar_weight].empty?
			flash[:error] = "Weight and bar weight cannot be blank."
			redirect_to tools_wendlers_path and return
		end

		if params[:weight].empty?
			flash[:error] = "Please add a weight total."
			redirect_to tools_wendlers_path and return
		end

		if params[:bar_weight].empty?
			flash[:error] = "Please add a bar weight"
			redirect_to tools_wendlers_path and return
		end

		if params[:bar_weight].to_i > params[:weight].to_i
			flash[:error] = "Bar weight cannot be more than total weight"
			redirect_to tools_wendlers_path and return
		end

		if params[:bar_weight].to_i > 45
			flash[:error] = "Bar weight cannot exceed 45lbs"
			redirect_to tools_wendlers_path and return
		end

		if params[:bar_weight].to_i < 15 ||  params[:weight].to_i < 15
			flash[:error] = "Weight has to be at least 15lbs"
			redirect_to tools_wendlers_path and return
		end

		@week = params[:week]
		wendler_result = WendlerCalc.new(params[:weight], @week).run
		@results = wendler_result.inject([]) do |ar, val|
			result = [ val[0], val[1], WeightCalc.new(val[1], params[:bar_weight]).calc ]
			ar << result
			ar
		end
		render :results
	end


end