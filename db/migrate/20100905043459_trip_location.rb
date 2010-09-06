class TripLocation < ActiveRecord::Migration
  def self.up
    add_column :trips, :location, :string
    add_column :trips, :activity, :string
  end

  def self.down
    remove_column :trips, :activity
    remove_column :trips, :location
  end
end