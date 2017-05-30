class Mailbox < ApplicationRecord
  belongs_to :last_message, class_name: 'Message', optional: true

  def last_mailbox_message
    MailboxMessage.find_or_create_by!(mailbox: self, message: last_message)
  end

  def set_oof_with_new_message(message)
    last_message = message
    last_mailbox_message
  end
end
