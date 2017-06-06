class Mailbox < ApplicationRecord
  belongs_to :last_message, class_name: 'Message', optional: true

  def last_mailbox_message
    MailboxMessage.where(mailbox: self, message: last_message).order(created_at: :desc).first if last_message
  end

  def set_oof_with_new_message(message)
    last_message = message
    last_mailbox_message
  end
end
