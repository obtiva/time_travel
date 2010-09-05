class CreateUserPreferences < ActiveRecord::Migration
  def self.up
    create_table :user_preferences do |t|
      t.references :user
      t.string :kind
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :user_preferences
  end
end
