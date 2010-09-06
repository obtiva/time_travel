class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :request_sender_id
      t.integer :request_receiver_id
      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
