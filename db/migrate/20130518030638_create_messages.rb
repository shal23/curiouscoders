class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :show_sender
      t.boolean :show_recipient
      t.boolean :read

      t.timestamps
    end
  end
end
