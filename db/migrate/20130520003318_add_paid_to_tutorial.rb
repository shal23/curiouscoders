class AddPaidToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :paid, :boolean
  end
end
