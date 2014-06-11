class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :agreement_id
      t.integer :user_id
      t.datetime :ride_when
      t.text :origin
      t.text :destination
      t.float :cost
      t.integer :seats
      t.text :notes

      t.timestamps
    end
  end
end
