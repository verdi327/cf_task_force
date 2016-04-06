class Admin::MessagesController < Admin::BaseController
  def index
    @messages = Message.all
  end

  def new
    clients = [{"id"=>2076971, "first_name"=>"Michael", "middle_name"=>"Richard", "last_name"=>"Verdi", "guardian_name"=>nil, "name"=>"Michael Verdi", "membership"=>"No Membership", "is_member"=>false, "joined_at"=>"2016-02-03T17:59:18Z", "phone"=>"4437973663", "email"=>"james.assad@icloud.com", "address"=>nil, "secondary_info_field"=>"No Membership", "guardian_email"=>nil, "timezone"=>"America/New_York", "business_id"=>14922, "updated_at"=>"2016-04-04T13:27:14Z", "deleted_at"=>nil, "hidden_at"=>nil, "birthdate"=>"1977-08-05", "location_id"=>20039, "custom_fields"=>[{"id"=>95016, "value"=>"XL", "name"=>"T-Shirt Size"}, {"id"=>95017, "value"=>"Word of Mouth", "name"=>"How'd You Hear About Us"}, {"id"=>95018, "value"=>["Improve General Quality of Life", "Improve Self Esteem", "Improve Body Composition", "Improve Flexibility"], "name"=>"Fitness Goals"}, {"id"=>95019, "value"=>false, "name"=>"Preexisting Injury?"}, {"id"=>95059, "value"=>"Male", "name"=>"Gender"}]}, {"id"=>2078863, "first_name"=>"Stephen", "middle_name"=>nil, "last_name"=>"Godbee", "guardian_name"=>nil, "name"=>"Stephen Godbee", "membership"=>"No Membership", "is_member"=>false, "joined_at"=>"2016-02-03T18:58:37Z", "phone"=>"6787872671", "email"=>"godbeeskg@aol.com", "address"=>nil, "secondary_info_field"=>"No Membership", "guardian_email"=>nil, "timezone"=>"America/New_York", "business_id"=>14922, "updated_at"=>"2016-04-04T13:27:14Z", "deleted_at"=>nil, "hidden_at"=>nil, "birthdate"=>"1989-12-06", "location_id"=>20039, "profile_photo"=>{"x50"=>"https://d1nqv8xdwxria6.cloudfront.net/uploads/profile_photo/image/333d2410-70f9-4ba7-8953-f13687ed3b4a/image_profile_x50.jpg", "x100"=>"https://d1nqv8xdwxria6.cloudfront.net/uploads/profile_photo/image/333d2410-70f9-4ba7-8953-f13687ed3b4a/image_profile_x100.jpg", "x200"=>"https://d1nqv8xdwxria6.cloudfront.net/uploads/profile_photo/image/333d2410-70f9-4ba7-8953-f13687ed3b4a/image_profile_x200.jpg", "x400"=>"https://d1nqv8xdwxria6.cloudfront.net/uploads/profile_photo/image/333d2410-70f9-4ba7-8953-f13687ed3b4a/image_profile_x400.jpg"}, "custom_fields"=>[{"id"=>95016, "value"=>"L", "name"=>"T-Shirt Size"}, {"id"=>95017, "value"=>"Word of Mouth", "name"=>"How'd You Hear About Us"}, {"id"=>95018, "value"=>["Improve General Quality of Life", "Improve Flexibility", "Find the Limits of Your Physical and Mental Limits"], "name"=>"Fitness Goals"}, {"id"=>95019, "value"=>false, "name"=>"Preexisting Injury?"}, {"id"=>95020, "value"=>"Benjamin Bunn", "name"=>"Assigned Coach"}, {"id"=>95059, "value"=>"Male", "name"=>"Gender"}]}, {"id"=>2084178, "first_name"=>"Danny", "middle_name"=>nil, "last_name"=>"Shenker", "guardian_name"=>nil, "name"=>"Danny Shenker", "membership"=>"No Membership", "is_member"=>false, "joined_at"=>"2016-02-03T23:50:27Z", "phone"=>"5168300668", "email"=>"danshenk619@gmail.com", "address"=>nil, "secondary_info_field"=>"No Membership", "guardian_email"=>nil, "timezone"=>"America/New_York", "business_id"=>14922, "updated_at"=>"2016-04-05T00:44:27Z", "deleted_at"=>nil, "hidden_at"=>nil, "birthdate"=>"1990-05-08", "location_id"=>20039, "custom_fields"=>[{"id"=>95016, "value"=>"L", "name"=>"T-Shirt Size"}, {"id"=>95017, "value"=>"Word of Mouth", "name"=>"How'd You Hear About Us"}, {"id"=>95018, "value"=>["Improve General Quality of Life", "Improve Self Esteem", "Improve Body Composition", "Find the Limits of Your Physical and Mental Limits"], "name"=>"Fitness Goals"}, {"id"=>95019, "value"=>false, "name"=>"Preexisting Injury?"}, {"id"=>95059, "value"=>"Male", "name"=>"Gender"}]}]
    @clients = clients.map {|client| "#{client['name']} - #{client['phone']}" }
    @coaches = Coach.all.pluck(:name)
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.recipient_total = @message.recipients.size - 1 #account for empty string at index 0


    respond_to do |format|
      if @message.save
        format.html { redirect_to admin_message_path(@message), notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def refresh_client_list
    conn = Faraday.new(url: "https://cigarcitycrossfit.frontdeskhq.com")
    response = conn.get("/api/v2/desk/people.json?access_token=46SdIzBAj8fLOW0E4iUIp1nYsvzEako2emSCZbew")
    @clients = JSON.parse(response.body)["people"]
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:created_by, :body, :recipients => [])
    end

    def get_auth_code
      conn = Faraday.new(url: "https://frontdeskhq.com")
      response = conn.post do |req|
        req.url '/oauth/token'
        req.headers['Content-Type'] = 'application/json'
        req.body = '{ "grant_type": "authorization_code", "code": "6mIY3ged9JhZjM4bx0Tl", "redirect_uri": "http://localhost:3000/fdhq-callback", "client_id": "H976y2NokSuqQbjup6UaBJS0YvLQcbtfSTePrBQt", "client_secret": "VEX8xyEQC3DBOdWshTZmf8wH3DrLKVF4U6cqLBrp"}'
      end
    end
end
