class AddAttachmentLogoToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :locations, :logo
  end
end
