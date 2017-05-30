json.extract! mailbox, :id, :name, :email, :last_message_id, :created_at, :updated_at
json.url mailbox_url(mailbox, format: :json)
