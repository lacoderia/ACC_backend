class CreateInsurancePrices < ActiveRecord::Migration
  def change
    create_table :insurance_prices do |t|
      t.string :vehicle_type
      t.string :size
      t.string :age_old
      t.float :price

      t.timestamps
    end
  end
end
