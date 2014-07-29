class CreateLocationTypes < ActiveRecord::Migration
  def change
    create_table :location_types do |t|
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
