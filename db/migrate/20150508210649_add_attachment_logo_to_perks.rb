class AddAttachmentLogoToPerks < ActiveRecord::Migration
  def self.up
    change_table :perks do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :perks, :logo
  end
end
