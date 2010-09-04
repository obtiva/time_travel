class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :image_name

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
