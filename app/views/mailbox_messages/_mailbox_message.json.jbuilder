json.extract! mailbox_message, :id, :mailbox_id_id, :message_id_id, :created_at, :updated_at
json.url mailbox_message_url(mailbox_message, format: :json)
