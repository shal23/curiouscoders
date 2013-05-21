class AddColsToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :when, :date
    add_column :conversations, :where, :string
    add_column :conversations, :url, :string
    add_column :conversations, :done, :boolean
  end
end
