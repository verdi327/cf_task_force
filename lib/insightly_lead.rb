class InsightlyLead
	attr_reader :params

	def initialize(params)
		@params = params
	end

	def to_json
		{
		  "first_name"=>"#{params[:first_name]}", 
		  "last_name"=>"#{params[:last_name]}", 
		  "contactinfos"=>[{"contact_info_id"=>0, "type"=>"Email", "subtype"=>"", "label"=>"Work", "detail"=>"#{params[:email]}"},{"contact_info_id"=>0, "type"=>"Phone", "subtype"=>"", "label"=>"Work", "detail"=>"#{params[:phone]}"}],
		  "tags"=>[{"tag_name"=>"#{params[:leadsource]}"}], 
		  "date_created_utc"=>"#{utc_time}"
		}
	end

	private

	def utc_time
		Time.now.utc.to_s.delete('UTC').strip
	end
end