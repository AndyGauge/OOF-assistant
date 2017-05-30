class MailboxMessage < ApplicationRecord
  belongs_to :mailbox
  belongs_to :message
  accepts_nested_attributes_for :message

end
