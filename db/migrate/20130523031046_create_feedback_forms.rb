class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
