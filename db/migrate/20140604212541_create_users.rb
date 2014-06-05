class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :document_type
      t.string :document_id
      t.boolean :is_member
      t.integer :agreement_id
      t.string :phone_number
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
