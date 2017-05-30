class CreateMailboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mailboxes do |t|
      t.string :name
      t.string :email
      t.references :last_message

      t.timestamps
    end
  end
end
