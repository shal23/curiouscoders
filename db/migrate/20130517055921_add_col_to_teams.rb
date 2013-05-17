class AddColToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :creator, :integer
  end
end
