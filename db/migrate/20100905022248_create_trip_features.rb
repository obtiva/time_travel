class CreateTripFeatures < ActiveRecord::Migration
  def self.up
    create_table :trip_features do |t|
      t.references :trip
      t.string :kind
      t.string :slug
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :trip_features
  end
end
