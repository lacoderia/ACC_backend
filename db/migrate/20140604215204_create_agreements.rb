class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.integer :agreement_no
      t.string :name
      t.string :logo
      t.string :mail_domain
      t.boolean :active

      t.timestamps
    end
  end
end
