class AddHoursToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :hours, :integer
  end
end
