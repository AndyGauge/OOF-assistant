class CreateMailboxMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :mailbox_messages do |t|
      t.references :mailbox, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
