class AddAttributesToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :team_id, :integer
  end
end
