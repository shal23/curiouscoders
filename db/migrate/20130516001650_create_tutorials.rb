class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :about
      t.string :url
      t.references :user

      t.timestamps
    end
    add_index :tutorials, :user_id
  end
end
