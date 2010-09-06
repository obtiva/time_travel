class AddTripField < ActiveRecord::Migration
  def self.up
    add_column :trips, :slug, :string
    add_column :trips, :tag_line, :string
  end

  def self.down
    remove_column :trips, :tag_line
    remove_column :trips, :slug
  end
end