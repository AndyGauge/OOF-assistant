class MailboxMessagesController < ApplicationController
  before_action :set_mailbox_message, only: [:show, :edit, :update, :destroy, :publish]

  # GET /mailbox_messages
  # GET /mailbox_messages.json
  def index
    @mailbox_messages = MailboxMessage.all
  end

  # GET /mailbox_messages/1
  # GET /mailbox_messages/1.json
  def show
  end

  def publish
    @successful = send_xml_to_exchange == "200"
    self.content_type = "text/html"
  end

  # GET /mailbox_messages/new
  def new
    @mailbox_message = MailboxMessage.new
  end

  # GET /mailbox_messages/1/edit
  def edit
  end

  # POST /mailbox_messages
  # POST /mailbox_messages.json
  def create
    @mailbox_message = MailboxMessage.new(mailbox_message_params)

    respond_to do |format|
      if @mailbox_message.save
        mailbox = @mailbox_message.mailbox
        mailbox.last_message = @mailbox_message.message
        mailbox.save

        format.html { redirect_to publish_mailbox_message_path(@mailbox_message), notice: 'Updating Out of Office status.' }
        format.json { render :show, status: :created, location: @mailbox_message }
      else
        format.html { render :new }
        format.json { render json: @mailbox_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailbox_messages/1
  # PATCH/PUT /mailbox_messages/1.json
  def update
    respond_to do |format|
      if @mailbox_message.update(mailbox_message_params)
        format.html { redirect_to @mailbox_message, notice: 'Mailbox message was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailbox_message }
      else
        format.html { render :edit }
        format.json { render json: @mailbox_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailbox_messages/1
  # DELETE /mailbox_messages/1.json
  def destroy
    @mailbox_message.destroy
    respond_to do |format|
      format.html { redirect_to mailbox_messages_url, notice: 'Mailbox message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailbox_message
      @mailbox_message = MailboxMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailbox_message_params
      params.require(:mailbox_message).permit(:mailbox_id, :message_id, message_attributes: [:summary, :body])
    end

    def send_xml_to_exchange
      uri = URI.parse(EXCHANGE_CONFIG['server'])
      http = Net::HTTP::Post.new(uri.path)
      http.body =  render_to_string(template: "mailbox_messages/show.xml.builder", :layout => false)
      http.content_type = 'text/xml'
      http.basic_auth EXCHANGE_CONFIG['user'], EXCHANGE_CONFIG['pass']

      socket = Net::HTTP.new(uri.host, uri.port)
      socket.use_ssl = true
      resp = (socket.start{ |request| request.request http }).code
    end

end
