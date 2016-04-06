class Admin::MessagesController < Admin::BaseController
  def index
    @messages = Message.order(created_at: :desc).page(params[:page])
  end

  def new
    clients = refresh_client_list
    @clients = clients.map {|client| "#{client['name']} - #{client['phone']}" }
    @coaches = Coach.all.pluck(:name)
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.recipients = @message.recipients[1..-1] #account for empty string at index 0
    @message.recipient_total = @message.recipients.size


    respond_to do |format|
      if @message.save
        MessageJob.perform_later(@message)
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
    response = conn.get("/api/v2/desk/people.json?access_token=#{ENV['FDHQ_AUTH_TOKEN']}")
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
