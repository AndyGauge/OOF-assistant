xml.instruct!(:xml, encoding: "UTF-8")
xml.soap(:Envelope,
  {"xmlns:xsi"  => "http://www.w3.org/2001/XMLSchema-instance",
   "xmlns:xsd"  => "http://www.w3.org/2001/XMLSchema",
   "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/"}) do
     xml.soap :Body do
       xml.SetUserOofSettingsRequest xmlns: "http://schemas.microsoft.com/exchange/services/2006/messages" do
         xml.Mailbox xmlns: "http://schemas.microsoft.com/exchange/services/2006/types" do
           xml.Name @mailbox_message.mailbox.name
           xml.Address @mailbox_message.mailbox.email
           xml.RoutingType "SMTP"
         end
         xml.UserOofSettings xmlns: "http://schemas.microsoft.com/exchange/services/2006/types" do
           xml.OofState "Enabled"
           xml.ExternalAudience "All"
           xml.Duration do
             xml.StartTime Time.now.xmlschema
             xml.EndTime (Time.now + 7.days).xmlschema
           end
           xml.InternalReply do
             xml.Message @mailbox_message.message.body
           end
           xml.ExternalReply do
             xml.Message @mailbox_message.message.body
           end
         end
       end
     end
   end
