class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.references :user
      t.references :trip
      t.string :pay_type
      t.date :purchase_date
      t.date :real_travel_date
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
