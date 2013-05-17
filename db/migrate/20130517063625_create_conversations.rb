class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :team_id
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
