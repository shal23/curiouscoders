class AddProfileAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :location, :string
    add_column :users, :time_zone, :string
    add_column :users, :google_plus, :string
    add_column :users, :school, :string
    add_column :users, :occupation, :string
    add_column :users, :about, :text
  end
end
