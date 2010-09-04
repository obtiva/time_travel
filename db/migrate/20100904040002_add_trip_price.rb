class AddTripPrice < ActiveRecord::Migration
  def self.up
    add_column :trips, :price, :integer, :default => 0
  end

  def self.down
    remove_column :trips, :price
  end
end